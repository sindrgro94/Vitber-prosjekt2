%%Mainfila
[xPos,yPos,xVel,yVel]= forwardEuler(timestep, xPosStart, yPosStart, xVelStart, yVelStart, Vdc, Vac, omega, r0, q, mass, totalTime);
t = 0:timestep:20*10^-6;
x = xPosStart*cos(sqrt(Vdc*2*q/(mass*r0^2))*t);
hold on
plot(t,x,'r');
plot(t,xPos(1:length(t)));