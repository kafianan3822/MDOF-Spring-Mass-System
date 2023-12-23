clc;
clear all;
close all;

m1 = input('Mass of first object: ');
m2 = input('Mass of second object: ');
M = [m1 0;0 m2];
k1 = input('First spring constant: ');
k2 = input('Second spring constant: ');
k3 = input('Third spring constant: ');
c1 = input('Viscous damping for first portion: ');
c2 = input('Viscous damping for second portion: ');
c3 = input('Viscous damping for third portion: ');
C = [c1+c2 -c2;-c2 c2+c3];
K = [k1+k2 -k2;-k2 k2+k3];
[modeShape freq] = eig(K,M);

A00 = zeros(2);
A10 = eye(2);
CC = [A00 A10; -inv(M)*K -inv(M)*C];
global CC;
max_freq = max(sqrt(diag(freq))/(2*pi));
dt = 1/(max_freq*20);
time = 0:dt:200*dt;

c1 = input('Initial displacement of first body: ');
c2 = input('Initial displacement of second body: ');
c3 = input('Initial velocity of first body: ');
c4 = input('Initial velocity of second body: ');

y0 = [c1 c2 c3 c4];
[tsol,ysol] = ode23('odetest2DOF1',time,y0);
plot(time,ysol(:,1:2),'linewidth',1);
xlabel('Time(s)');
ylabel('Displacement(m)')
grid on
figure
plot(time,ysol(:,3:4),'linewidth',1);
xlabel('Time(t)');
ylabel('Velocity(m/s)');
grid on

figure
axis([min(ysol(:,2))-1 max(ysol(:,2))+1 -0.1 0.1]);
grid on
hold on
mass1 = plot(ysol(1,1), 0, 'bo', 'MarkerSize', 30, 'MarkerFaceColor', 'b');
mass2 = plot(ysol(1,2), 0, 'ro', 'MarkerSize', 20, 'MarkerFaceColor', 'r');

% Loop through the time steps and update the position of the masses
for i = 1:length(time)
    set(mass1, 'XData', ysol(i,1), 'YData', 0);
    set(mass2, 'XData', ysol(i,2)+.5, 'YData', 0);
    pause(dt);
end