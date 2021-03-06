%plotter bra og d�rlige verdier for massen med Vac og Vdc
function plotDeltaM()
[givenMass, gjennom, masse,deltam,snitt] = deltaM(5,30,0.1, 3.85,23); %deltaM(10,40,0.1, 7.6,46.05);
[givenMass1, gjennom1, masse1,deltam1,snitt1] = deltaM(5,30,0.1, 2.3,23); %deltaM(10,40,0.1, 4,35);
fig = figure();
hold on
plot(givenMass,gjennom)         %Plott av hvilket partikler som kom gjennom
plot(givenMass1,gjennom1,'r')
ylim([0,1.1])
title('Partikkel gjennom sensoren s.f.m. massen og spenningen')
xlabel('masse (u)')
ylabel('Partikler som n�r gjennom sensor')
legend('Vdc = 3.85V, Vac = 23V','Vdc = 2.3V, Vac = 23V')

saveTightFigure(fig,'timestep1')