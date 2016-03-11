%Funskjon for å bestemme deltaM
%denne funskjonen sier hvilket av verdier av massen gitt i u som kommer
%gjennom sensoren. 
%Den gir ut vektoren [masse] som gir alle massene som går gjennom
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
Vdc = 7.6; %for fem perioder kan vi bruke Vdc = 3.2222, optimal Vdc = 7.7
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
for m = 25:.1:35 %Verdier rundt Vdc = 7.7 og Vac = 46.05 m = 27.7:0.05:28.2
    mass = u*m;
   thru =  RK4success(timestep,xPosStart,yPosStart,...
    xVelStart, yVelStart,zVelStart,Vdc,Vac,omega,r0,q,mass,totalTime); %Bestemmer om partikkel med gitt masse kommer gjennom
if thru == 1
    gjennom(i) = 1;         %Setter resultatet opp mot massen
    givenMass(i) = m;       %Setter opp massen som kom gjennom
    masse(count)=m;         %Skriver kun ned massen som kom gjennom
    count = count +1;       
    i = i+1;
else
    gjennom(i)=0;           %Setter resultatet opp mot massen
    givenMass(i) = m;       %Setter masson som kom gjennom
    i =i+1;
end

end
toc
snitt = mean(masse);            %Snittmassen som kom gjennom
deltam = abs(max(masse)-snitt); %Delta M, ikke helt korrekt
plot(givenMass,gjennom)         %Plott av hvilket partikler som kom gjennom
    