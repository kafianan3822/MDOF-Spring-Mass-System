clc;
clear all;
close all;

global m k c w_f F0

mass = "Mass of body: ";
m = input(mass);
sprnConst = "Spring constant: ";
k = input(sprnConst);
dampC = "Damping constant: ";
c = input(dampC);
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
[tsol,ysol] = ode45('odetest4',0:dt:3,y0);
plot(t,ysol(:,2));
grid on;
xlabel('Displacement')
ylabel('metres')
figure
plot(t,ysol(:,1));
grid on;
xlabel('Velocity')
ylabel('metre/sec')
T = 2*pi*sqrt(m/k)
figure;

% create mass plot
mass = plot(ysol(1,2), 0, 'bo', 'MarkerSize', 30, 'MarkerFaceColor', 'b');

% set axis limits
axis([min(ysol(:,2))-0.1 max(ysol(:,2))+0.1 -0.1 0.1]);

% loop through time steps and update position of mass
time = t;
for i = 1:length(time)
    set(mass, 'XData', ysol(i,2));
    pause(dt);
end
