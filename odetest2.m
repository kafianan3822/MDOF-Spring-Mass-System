function dy = odetest2(t,y)
global m k w_f F0

f1 = F0*sin(2*pi*w_f*t);
dy(1) = (f1 - k*y(2))/m;
dy(2) = y(1);
dy=dy';