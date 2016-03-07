%%plotStableAndUnstable
[timestep,xPosStart,yPosStart,xVelStart, yVelStart,...
zVelStart,Vdc,Vac,omega,r0,q,mass,totalTime] = getVariables();
%%stabil bane:
Vdc = 5;
Vac = 45;
[xPos,yPos,zPos] = RK4(timestep,xPosStart,yPosStart,xVelStart, yVelStart,...
zVelStart,Vdc,Vac,omega,r0,q,mass,totalTime);
figure(1);
title('Stabil bane');
xlabel('Distanse z-aksen [m]');
ylabel('Distanse x/y-aksen [m]');
hold on
plot(zPos,xPos,'b');
plot(zPos,yPos,'r');
legend('x-posisjon','y-posisjon');
