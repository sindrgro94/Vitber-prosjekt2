%%plotStableAndUnstable
[timestep,xPosStart,yPosStart,xVelStart, yVelStart,...
zVelStart,Vdc,Vac,omega,r0,q,mass,totalTime] = getVariables();
%%stabil bane:
Vdc = 1;
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
%% Ustabil bane:
Vdc = 8;
Vac = 40;
[xPos,yPos,zPos] = RK4(timestep,xPosStart,yPosStart,xVelStart, yVelStart,...
zVelStart,Vdc,Vac,omega,r0,q,mass,totalTime);
figure(2);
title('Ustabil bane');
xlabel('Distanse z-aksen [m]');
ylabel('Distanse x/y-aksen [m]');
hold on
plot(zPos,xPos,'b');
plot(zPos,yPos,'r');
legend('x-posisjon','y-posisjon');
ylim([-0.004 0.004]);
