clear all;
close all;
clc;

acr = AcrobotParameters('num'); 
% Choose collocated or non-collocated implementation.
acr.controller_type = 'noncollocated'; % Choose: noncollocated, collocated.
% 1) noncollocated controller is really crazy and can stabilize to any target
% angle! The downside is that it requires basically boundless torque.
% 2) collocated controller does a reasonable "pumping" motion for swing-up.
% The downside is that it can't stabilize without some linear controller to
% keep it at the top.
% 3) none - no controller mode. Play around with the free pendulum.% Choose: noncollocated, collocated, none


% Initial conditions:
init = [-pi/2    0    0   0]';

% Simulation duration
duration = 10;
animationSpeed = 1;

%{}
options1 = odeset('AbsTol', 1e-6,'RelTol',1e-6); %Transition from swing up to linear balance controller when conditions met.
[tarray, zarray] = ode15s(@CLsystem, [0 duration], init, options1, acr);


%Tc = ones(length(tarray),1);

if strcmp(acr.controller_type,'noncollocated') 
	qdes = acr.goal;
	Tc = ComputeTorque1(acr.I1,acr.I2,acr.g0,acr.kd1,acr.kp1,acr.l1,acr.lc1,acr.lc2,acr.m1,acr.m2,zarray(:,1),zarray(:,3),zarray(:,2),zarray(:,4),qdes);
elseif strcmp(acr.controller_type,'collocated') 
	qdes = acr.alpha*atan(zarray(:,2));
	Tc = ComputeTorque2(acr.I1,acr.I2,acr.g0,acr.kd2,acr.kp2,acr.l1,acr.lc1,acr.lc2,acr.m1,acr.m2,zarray(:,1),zarray(:,3),zarray(:,2),zarray(:,4),pi/2);
end
%}


[tarray, zarray, Tc] = ComputeDynamics(init, duration, 2000, acr);

energy = ComputeEnergy(zarray(:,1),zarray(:,2),zarray(:,3),zarray(:,4));

acc1 = zarray(:,2); %for plots
acc2 = zarray(:,4); %for plots

makeplot