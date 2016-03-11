%Oppgave 8
%Bestemmer tilfelige innverdier
function [xPosStart,yPosStart,xVelStart,yVelStart] = randomValues(r0,zVelStart)
r = rand(1)*r0/2;       %Tilfeldig radius
theta = rand(1)*2*pi;   %Tilfeldig vinkel theta
phi = rand(1)*2*pi/180; %Tilfeldig vinkel med z-aksen
theta1 = rand(1)*2*pi;  %Tilfeldig vinkel for xVel og yVel

%Gir tilfeldige verdier i en radius r0/2 fra sentrum
xPosStart = r*cos(theta);
yPosStart = r*sin(theta);
%Gir tilfeldige verdier i for hastigheten x- og y-retning
xVelStart = zVelStart*sin(phi)*cos(theta1);
yVelStart = zVelStart*sin(phi)*sin(theta1);