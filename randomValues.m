%Oppgave 8
%bestemmer et tilfelig punkt 
function [xPosStart,yPosStart,xVelStart,yVelStart] = randomValues(r0,zVelStart)
r = rand(1)*r0/2;       %Tilfeldig radius
theta = rand(1)*2*pi;   %Tilfelig vinkel theta
phi = rand(1)*2*pi/180; %Tilfelig vinkel med z-aksen

%Gir tilfeldige verdier i en radius r0/2 fra sentrum
xPosStart = r*cos(theta);
yPosStart = r*sin(theta);
%Gir tilfeldige verdier i for hastigheten x- og y-retning
xVelStart = zVelStart*sin(phi)*cos(theta);
yVelStart = zVelStart*sin(phi)*sin(theta);