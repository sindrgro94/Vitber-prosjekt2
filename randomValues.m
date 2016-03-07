%Oppgave 8
%bestemmer et tilfelig punkt 
function [xPosStart,yPosStart,xVelStart,yVelStart] = randomValues(r0,zVelStart)
r = rand(1)*r0/2;
theta = rand(1)*2*pi;
phi = rand(1)*2*pi/180;


xPosStart = r*cos(theta);
yPosStart = r*sin(theta);
xVelStart = zVelStart*sin(phi)*cos(theta);
yVelStart = zVelStart*sin(phi)*sin(theta);