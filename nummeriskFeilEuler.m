function [feil_Euler,xPosEuler] = nummeriskFeilEuler(timestep)
%[timestep,xPosStart,yPosStart,xVelStart, yVelStart,zVelStart,Vdc,Vac,omega,r0,q,mass,totalTime] = getVariables();
%timestep = 0.003 * 10^(-7);
xPosStart = 1*10^(-3);
yPosStart = 0;
xVelStart = 0;
yVelStart = 0;
Vdc = 3.2222;
Vac = 0;
omega = 0;
r0 = 0.0030;
q = 1.60217657*10^(-19);
mass = 28*1.660539040*10^(-27);
totalTime = 20*10^(-6);
totPoints = uint32(totalTime/timestep);
%%u = 1.660539040*10^(-27)
%%e = 1.60217657*10^(-19) 
%%Preallokering
xPosEuler = zeros(1,totPoints);
yPosEuler = zeros(1,totPoints);
xVelEuler = zeros(1,totPoints);
yVelEuler = zeros(1,totPoints);
feil_Euler = zeros(1,totPoints);
x = zeros(1,totPoints);
count = 1;
%%Startverdier
xPosEuler(count) = xPosStart;
yPosEuler(count) = yPosStart;
xVelEuler(count) = xVelStart;
yVelEuler(count) = yVelStart;

for time=0:timestep:totalTime
    count = count+1;
    [xPosEuler(count),yPosEuler(count),xVelEuler(count),yVelEuler(count)] = forwardEulerOneStep...
        (timestep,xPosEuler(count-1),yPosEuler(count-1),xVelEuler(count-1),yVelEuler(count-1),...
        Vdc,Vac,omega,time,r0,q,mass);
    x(count) = xPosStart*cos(sqrt(Vdc*2*q/(mass*r0^2))*time);
    feil_Euler(count) = abs(x(count)-xPosEuler(count));
end
t = 0:timestep:totalTime;
hold on
plot(t,xPosEuler(1:length(t)))
plot(t,x(1:length(t)))
% figure()
% plot(t,feil_Euler(1:length(t)))
% figure()
% loglog(t,feil_Euler(1:length(t)))
end