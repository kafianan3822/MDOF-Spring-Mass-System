function dy = odetest4(t,y)
global m k c w_f F0
f1 = F0*sin(2*pi*w_f*t);

dy = [f1/m - k*y(2)/m - c*y(1)/m; y(1)];