%Oppgave 4
function oppgave4(lengde, zVelStart,Vac,omega)
lengde = 0.1;
zVelStart = 5000;
Vac = 45;
omega = 10^7;
timestep =  10^(-11.5);
xPosStart = 1*10^(-3);
yPosStart = 1*10^(-3);
xVelStart = 0;
yVelStart = 0;
Vdc = 5;
r0 = 0.003;
q = 1.60217657*10^(-19);
mass = 28*1.660539040*10^(-27);
totalTime = lengde/zVelStart;
% [timestep,xPosStart,yPosStart,xVelStart, yVelStart,...
%     zVelStart,Vdc,Vac,omega,r0,q,mass,totalTime] = getVariables();

[xPos,yPos,xVel,yVel]= forwardEuler(timestep, xPosStart, yPosStart, xVelStart, yVelStart, Vdc, Vac, omega, r0, q, mass, totalTime);


t = 0:timestep:totalTime;
zPos = t*zVelStart; %Bestemmer z(t)

if sqrt(xPos(length(t))^2+yPos(length(t))^2) <= r0/2 %regner med at vi skal bruke dette i en forl?kke senere en gang. 
    fprintf('Den kom gjennom \n')                    %Det som skrives ut er ikke viktig, bare at det kommer noe n?r partiklen treffer sensoren
end

plot3(xPos(1:length(t)),yPos(1:length(t)),zPos); %3D plotting av banen til N2+ molekylet 
xlabel('x')
xlim([-r0,r0])
xlabel('x')
xlim([-r0,r0])
zlabel('z')

figure();
plot(xPos(1:length(t)),zPos)
xlabel('x')
ylabel('z')
xlim([-r0,r0])
figure();
plot(yPos(1:length(t)),zPos)
xlabel('y')
ylabel('z')
xlim([-r0,r0])



