%%plotStableAndUnstable
close all
[timestep,xPosStart,yPosStart,xVelStart, yVelStart,...
zVelStart,Vdc,Vac,omega,r0,q,mass,totalTime] = getVariables();
%%stabil bane:
Vdc = 3;
Vac = 40;
[xPos,yPos,zPos] = RK4(timestep,xPosStart,yPosStart,xVelStart, yVelStart,...
zVelStart,Vdc,Vac,omega,r0,q,mass,totalTime);
f1 = figure(1);
title('Stabil bane');
xlabel('Distanse z-aksen [m]');
ylabel('Distanse x/y-aksen [m]');
hold on
plot(zPos,xPos,'b');
plot(zPos,yPos,'r');
legend('x-posisjon','y-posisjon');
ylim([-0.003 0.003]);
%% Ustabil bane:
Vdc = 5;
Vac = 30;
[xPos,yPos,zPos] = RK4(timestep,xPosStart,yPosStart,xVelStart, yVelStart,...
zVelStart,Vdc,Vac,omega,r0,q,mass,totalTime);
f2 = figure(2);
title('Ustabil bane');
xlabel('Distanse z-aksen [m]');
ylabel('Distanse x/y-aksen [m]');
hold on
plot(zPos,xPos,'b');
plot(zPos,yPos,'r');
legend('x-posisjon','y-posisjon');
ylim([-0.003 0.003]);

%% kun ved lagring av filer:
saveTightFigure(f1,'Stabil bane')
saveTightFigure(f2,'Ustabil bane')