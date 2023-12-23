clc;
clear all;
close all;

global m k w_f F0

mass = "Mass of body: ";
m = input(mass);
sprnConst = "Spring constant: ";
k = input(sprnConst);
for_w = "Angular frequency of exciting force: ";
w_f = input(for_w);
F_amp = "Amplitude of exciting force: ";
F0 = input(F_amp);

dt = .005;
t = 0:dt:3;
c1 = "Initial velocity: ";
vel0 = input(c1);
c2 = "Iniitial displacement: ";
disp0 = input(c2);
y0 = [vel0 disp0]; %[vel disp]
[tsol,ysol] = ode45('odetest2',0:dt:3,y0);
plot(t,ysol(:,2));
xlabel('Displacement')
ylabel('metres')
figure
plot(t,ysol(:,1));
xlabel('Velocity')
ylabel('metre/sec')
T = 2*pi*sqrt(m/k)
figure
% creates mass plot
mass = plot(ysol(1,2), 0, 'bo', 'MarkerSize', 30, 'MarkerFaceColor', 'b');

% sets axis limits
axis([min(ysol(:,2))-0.1 max(ysol(:,2))+0.1 -0.1 0.1]);

% loops through time steps and update position of mass
time = t;
for i = 1:length(time)
    set(mass, 'XData', ysol(i,2));
    pause(dt);
end