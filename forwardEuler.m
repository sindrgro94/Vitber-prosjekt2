%% forward Euler
function [xPos,yPos,xVel,yVel] = forwardEuler(timestep,xPosStart,yPosStart,...
    xVelStart, yVelStart,xAccStart,yAccStart)
    
xPos = xPosStart + timestep*calculatePosition(xPosStart,xVelStart,xAccStart);
yPos = yPosStart + timestep*calculatePosition(yPosStart,yVelStart,yAccStart);
xVel = xVelStart + timestep*calculateVelocity(xPosStart,xVelStart,xAccStart);
yVel = yVelStart + timestep*calculateVelocity(xPosStart,xVelStart,xAccStart);
end