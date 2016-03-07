%Funskjon for � bestemme deltaM
function [masse] = deltaM()
timestep = 10^-9;
xPosStart = 1*10^(-3);
yPosStart = 1*10^-3;
xVelStart = 0;
yVelStart = 0;
zVelStart = 5000;
Vdc = 7; %for fem perioder kan vi bruke Vdc = 3.2222
Vac = 45;
omega = 10^7;
r0 = 0.0030;
q = 1.60217657*10^(-19);
%mass = 28*1.660539040*10^(-27);
totalTime = 20*10^(-6);
u = 1.660539040*10^(-27);
count = 1;
i = 1;
for m = 10:0.5:40
    tic
    mass = u*m;
   thru =  RK4success(timestep,xPosStart,yPosStart,...
    xVelStart, yVelStart,zVelStart,Vdc,Vac,omega,r0,q,mass,totalTime);
if thru == 1
    gjennom(i) = 1;
    givenMass(i) = m;
    masse(count)=m;
    count = count +1;
    i = i+1;
else
    gjennom(i)=0;
    givenMass(i) = m;
    i =i+1;
end
toc
end

plot(givenMass,gjennom)
    