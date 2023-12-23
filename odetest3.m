function dy = odetest3(t,y)
global m k c 

dy = [-k*y(2)/m-c*y(1)/m ; y(1)];
