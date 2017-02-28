function E = ComputeEnergy(q1,q2,q1d,q2d)
%COMPUTEENERGY
%    E = COMPUTEENERGY(Q1,Q2,Q1D,Q2D)

%    This function was generated by the Symbolic Math Toolbox version 6.2.
%    28-Feb-2017 23:35:25

t2 = cos(q1);
t3 = q1+q2;
t8 = q1d.*(1.0./2.0);
t9 = q2d.*(1.0./2.0);
t10 = t8+t9;
t4 = q1d.*t2+t10.*cos(t3);
t5 = q1d.^2;
t6 = sin(q1);
t7 = sin(t3);
t11 = q1d.*t6+t7.*t10;
t12 = q1d+q2d;
E = t5.*(1.0./1.0e1)+t6.*1.4715e1+t7.*(9.81e2./2.0e2)+t2.^2.*t5.*(1.0./8.0)+t5.*t6.^2.*(1.0./8.0)+t4.^2.*(1.0./2.0)+t11.^2.*(1.0./2.0)+t12.^2.*(1.0./2.0);
