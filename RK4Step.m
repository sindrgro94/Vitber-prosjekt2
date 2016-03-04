%RK4
function xPos = RK4Step(timestep,xPosStart,yPosStart,...
    xVelStart, yVelStart,Vdc,Vac,omega,t,r0,q,mass)
h = timestep;
xVel = xVelStart + timestep*electricForceX(Vdc,Vac,omega,t,xPosStart,r0,q)/mass;
s1 = xVel + t*electricForceX(Vdc,Vac,omega,t,xPosStart,r0,q)/mass;
s2 = xVel + (t+h/2)*electricForceX(Vdc,Vac,omega,t+h/2,xPosStart+h/2*s1,r0,q)/mass;
s3 = xVel + (t+h/2)*electricForceX(Vdc,Vac,omega,t+h/2,xPosStart+h/2*s2,r0,q)/mass;
s4 = xVel + (t+h)*electricForceX(Vdc,Vac,omega,t+h,xPosStart+h*s3,r0,q)/mass;
xPos = xPosStart + h/6*(s1+h/2*s2 + h/2*s3 +s4);

end    