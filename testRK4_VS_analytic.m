%%% Test av RK4 og Analytisk l�sning
timestep = 0.003 * 10^(-7);
xPosStart = 0;
yPosStart = 1*10^(-3);
xVelStart = 0;
yVelStart = 0;
Vdc = 5;
Vac = 0;
omega = 0;
r0 = 0.0030;
q = 1.60217657*10^(-19);
mass = 28*1.660539040*10^(-27);
totalTime = 20*10^(-6);
[xPos,yPos] = RK4(timestep, xPosStart, yPosStart, xVelStart, yVelStart, Vdc, Vac, omega, r0, q, mass, totalTime);
t = 0:timestep:20*10^-6;
x = xPosStart*cos(sqrt(Vdc*2*q/(mass*r0^2))*t);
y = yPosStart*cosh(sqrt(Vdc*2*q/(mass*r0^2))*t);
plot(t,y,'+r');
hold on
plot(t,yPos(1:length(t)),'O');