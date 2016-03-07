%% Returnerer 1 om den kom gjennom og 0 ellers
function success = RK4successStable(timestep,xPosStart,yPosStart,...
    xVelStart, yVelStart,zVelStart,Vdc,Vac,omega,r0,q,mass,totalTime)

    [xPos,yPos,zPos] = RK4(timestep,xPosStart,yPosStart,xVelStart, yVelStart,...
    zVelStart,Vdc,Vac,omega,r0,q,mass,totalTime);
%     Euler:
%     [xPos,yPos,xVel,yVel]= forwardEuler(timestep,xPosStart,yPosStart,xVelStart, yVelStart,...
%     Vdc,Vac,omega,r0,q,mass,totalTime);
    l = length(xPos);
    success = 1; %%godkjent inntil det motsatt er bevist
    for i = 1:l
        pos = sqrt(xPos(i)^2+yPos(i)^2);
        if (pos>r0)
            success = 0;
        end
    end
end