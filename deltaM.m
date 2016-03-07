%Funskjon for � bestemme deltaM
%denne funskjonen sier hvilket av verdier av massen gitt i u som kommer
%gjennom sensoren. 
%Den gir ut vektoren [masse] som gir alle massene som g�r gjennom
%Den gir ut konstanten deltam som bestemmer delta m
%Den gir ut konstanten snitt som er snittet av alle massene som kommer gjennom
%Optimale verdier er Vdc = 7.7, Vac = 46.05, xPosStart = yPosStart = 10^-3
function [masse,deltam,snitt] = deltaM()
timestep = 10^-9;
xPosStart = 1*10^(-3);
yPosStart = 1*10^-3;
xVelStart = 0;
yVelStart = 0;
zVelStart = 5000;
Vdc = 7.7; %for fem perioder kan vi bruke Vdc = 3.2222, optimal Vdc = 7.7
Vac = 46.05; %Optimal Vac = 46.05
omega = 10^7;
r0 = 0.0030;
q = 1.60217657*10^(-19);
%mass = 28*1.660539040*10^(-27);
totalTime = 20*10^(-6);
u = 1.660539040*10^(-27);
count = 1;
i = 1;
tic
for m = 27.7:0.05:28.2
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

end
toc
snitt = mean(masse);
deltam = abs(max(masse)-snitt);
plot(givenMass,gjennom)
    