function prosentGjennom = randomSuccess(masse, N, Vdc, Vac) %massen gis i "u", N = antall partikler

timestep = 10^-9;
totalTime = 20*10^(-6);
zVelStart = 5000;
%Vdc = 7.6; %for fem perioder kan vi bruke Vdc = 3.2222, optimal Vdc = 7.7
%Vac = 46.05; %Optimal Vac = 46.05
omega = 10^7;
r0 = 0.0030;
q = 1.60217657*10^(-19);
u = 1.660539040*10^(-27);
mass = masse*u;

gjennom = zeros(1,N);
gjennomAntall = 0;
tic
for i = 1:N
    [xPosStart,yPosStart,xVelStart,yVelStart] = randomValues(r0,zVelStart); %Gir tilfeldige inngangsverdier
    thru =  RK4success(timestep,xPosStart,yPosStart,...
    xVelStart, yVelStart,zVelStart,Vdc,Vac,omega,r0,q,mass,totalTime);%Bestemmer om partikkelen gikk gjennom
if thru == 1
    gjennom(i) = 1; %Bestemmer hvilket nummer som gikk gjennom
    gjennomAntall = gjennomAntall +1; %Teller antal gjennom
else
    gjennom(i)=0; %Gir null til dem som ikke kom gjennom
end

end
toc

prosentGjennom = gjennomAntall/N;

%%%For plotting
% t = 1:N;
% plot(t,gjennom,'xr');
% ylim([-0.5,1.5])
