function q2dd = AccelerationJoint2(I1,I2,T2,g0,l1,lc1,lc2,m1,m2,q1,q2,q1d,q2d)
%ACCELERATIONJOINT2
%    Q2DD = ACCELERATIONJOINT2(I1,I2,T2,G0,L1,LC1,LC2,M1,M2,Q1,Q2,Q1D,Q2D)

%    This function was generated by the Symbolic Math Toolbox version 5.10.
%    07-Mar-2017 12:04:46

t2 = q1+q2;
t3 = cos(t2);
t4 = sin(q2);
t5 = lc2.^2;
t6 = cos(q2);
t7 = m2.*t5;
t8 = l1.*lc2.*m2.*t6;
t9 = I2+t7+t8;
t10 = lc1.^2;
t11 = m1.*t10;
t12 = l1.^2;
t13 = t5+t12;
t14 = m2.*t13;
t15 = l1.*lc2.*m2.*t6.*2.0;
t16 = I1+I2+t11+t14+t15;
q2dd = -(t9.*(g0.*(cos(q1).*(l1.*m2+lc1.*m1)+lc2.*m2.*t3)-l1.*lc2.*m2.*t4.*(q1d.*q2d.*2.0+q2d.^2))-t16.*(-T2+g0.*lc2.*m2.*t3+l1.*lc2.*m2.*q1d.^2.*t4))./(t9.^2-t16.*(I2+t7));