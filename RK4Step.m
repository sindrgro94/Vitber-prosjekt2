%RK4
function [xPos,xVel, yPos, yVel] = RK4Step(timestep,xPosStart,yPosStart,...
    xVelStart, yVelStart,Vdc,Vac,omega,t,r0,q,mass)
h = timestep;     %dt             %a
s1 = xVelStart + (h)*(electricForceX(Vdc,Vac,omega,t,xPosStart,r0,q)/mass);
s2 = xVelStart + (h)*electricForceX(Vdc,Vac,omega,t+h/2,xPosStart+h/2*s1,r0,q)/mass;
s3 = xVelStart + (h)*electricForceX(Vdc,Vac,omega,t+h/2,xPosStart+h/2*s2,r0,q)/mass;
s4 = xVelStart + (h)*electricForceX(Vdc,Vac,omega,t+h,xPosStart+h*s3,r0,q)/mass;
xPos = xPosStart + h/6*(s1+2*s2 + 2*s3 +s4);


xVel1 = electricForceX(Vdc,Vac,omega,t,xPosStart,r0,q)/mass;
xVel2 = electricForceX(Vdc,Vac,omega,t+h/2,xPosStart+h/2*s1,r0,q)/mass;
xVel3 = electricForceX(Vdc,Vac,omega,t+h/2,xPosStart+h/2*s2,r0,q)/mass;
xVel4 = electricForceX(Vdc,Vac,omega,t+h,xPosStart+h*s3,r0,q)/mass;
xVel = xVelStart + h/6*(xVel1 + 2*xVel2 + 2*xVel3 + xVel4);

%%% for y
s1 = yVelStart + (h)*(electricForceY(Vdc,Vac,omega,t,yPosStart,r0,q)/mass);
s2 = yVelStart + (h)*electricForceY(Vdc,Vac,omega,t+h/2,yPosStart+h/2*s1,r0,q)/mass;
s3 = yVelStart + (h)*electricForceY(Vdc,Vac,omega,t+h/2,yPosStart+h/2*s2,r0,q)/mass;
s4 = yVelStart + (h)*electricForceY(Vdc,Vac,omega,t+h,yPosStart+h*s3,r0,q)/mass;
yPos = yPosStart + h/6*(s1+2*s2 + 2*s3 +s4);


yVel1 = electricForceY(Vdc,Vac,omega,t,yPosStart,r0,q)/mass;
yVel2 = electricForceY(Vdc,Vac,omega,t+h/2,yPosStart+h/2*s1,r0,q)/mass;
yVel3 = electricForceY(Vdc,Vac,omega,t+h/2,yPosStart+h/2*s2,r0,q)/mass;
yVel4 = electricForceY(Vdc,Vac,omega,t+h,yPosStart+h*s3,r0,q)/mass;
yVel = yVelStart + h/6*(yVel1 + 2*yVel2 + 2*yVel3 + yVel4);

end    