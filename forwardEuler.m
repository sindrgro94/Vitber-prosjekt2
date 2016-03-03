%% forward Euler
function [xPos,yPos,xVel,yVel] = forwardEuler(timestep,xPosStart,yPosStart,...
    xVelStart, yVelStart,xAccStart,yAccStart)
    
xPos = xPosStart + timestep*positionDerivative(xPosStart,xVelStart,xAccStart);
yPos = yPosStart + timestep*positionDerivative(yPosStart,yVelStart,yAccStart);
xVel = xVelStart + timestep*velocityDerivative(xPosStart,xVelStart,xAccStart);
yVel = yVelStart + timestep*velocityDerivative(xPosStart,xVelStart,xAccStart);
end