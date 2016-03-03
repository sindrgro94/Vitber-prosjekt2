%% forward Euler
function [xPos,yPos,xVel,yVel] = forwardEulerOnestep(timestep,xPosStart,yPosStart,...
    xVelStart, yVelStart,Vdc,Vac,omega,t,r0,q,mass)
    
xPos = xPosStart + timestep*xVelStart;
yPos = yPosStart + timestep*yVelStart;
xVel = xVelStart + timestep*electricForceX(Vdc,Vac,omega,t,xPosStart,r0,q)/mass;
yVel = yVelStart + timestep*electricForceY(Vdc,Vac,omega,t,yPosStart,r0,q)/mass;
end