%%plotStableAndUnstable
close all
clear all
[timestep,xPosStart,yPosStart,xVelStart, yVelStart,...
zVelStart,Vdc,Vac,omega,r0,q,mass,totalTime] = getVariables();
%%stabil bane:
Vdc = 3;
Vac = 40;
[xPos,yPos,zPos] = RK4(timestep,xPosStart,yPosStart,xVelStart, yVelStart,...
zVelStart,Vdc,Vac,omega,r0,q,mass,totalTime);
f1 = figure(1);
hold on
title('Stabil bane');
xlabel('Distanse z-aksen [m]');
ylabel('Distanse x/y-aksen [m]');
plot(zPos,xPos,'b');
plot(zPos,yPos,'r');
legend('x-posisjon','y-posisjon');
ylim([-0.003 0.003]);
%% Ustabil bane:
Vdc = 3.4;
Vac = 30;
[xPos,yPos,zPos] = RK4(timestep,xPosStart,yPosStart,xVelStart, yVelStart,...
zVelStart,Vdc,Vac,omega,r0,q,mass,totalTime);
l = length(xPos);
%finner hvor man skal slutte ? tegne banen
stop = 0;
counter = 0;
while stop == 0
    counter = counter + 1;
    if (sqrt(xPos(counter)^2+yPos(counter)^2)>r0)
        stop = 1;
    end
end
interval = 1:counter;
f2 = figure(2);
title('Ustabil bane');
xlabel('Distanse z-aksen [m]');
ylabel('Distanse x/y-aksen [m]');
hold on
plot(zPos(interval),xPos(interval),'b');
plot(zPos(interval),yPos(interval),'r');
legend('x-posisjon','y-posisjon');
ylim([-0.003 0.003]);
xlim([0 0.1]);

%% kun ved lagring av filer:
%saveTightFigure(f1,'Stabil bane')
%saveTightFigure(f2,'Ustabil bane')