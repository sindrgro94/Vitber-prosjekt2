%%%funksjon som returnerer riktige variable:
function [timestep,xPosStart,yPosStart,xVelStart, yVelStart,...
    zVelStart,Vdc,Vac,omega,r0,q,mass,totalTime] = getVariables()
lengde = 0.1;
zVelStart = 5000;
Vac = 45;
omega = 10^7;
timestep = 10^(-11.5);
xPosStart = 1*10^(-3);
yPosStart = 1*10^(-3);
xVelStart = 0;
yVelStart = 0;
Vdc = 5;
r0 = 0.003;
q = 1.60217657*10^(-19);
mass = 28*1.660539040*10^(-27);
totalTime = lengde/zVelStart;
end