%% Returnerer 1 om den kom gjennom og 0 ellers
function success = RK4success(timestep,xPosStart,yPosStart,...
    xVelStart, yVelStart,zVelStart,Vdc,Vac,omega,r0,q,mass,totalTime)

    [xPos,yPos,zPos] = RK4(timestep,xPosStart,yPosStart,xVelStart, yVelStart,...
    zVelStart,Vdc,Vac,omega,r0,q,mass,totalTime);
    l = length(xPos);
    pos = sqrt(xPos(l)^2+yPos(l)^2);
    if pos<r0/2
        success = 1;
    else
        success = 0;
    end
    

end