%plotter bra og dårlige verdier for massen med Vac og Vdc
function plotDeltaM()
[givenMass, gjennom, masse,deltam,snitt] = deltaM(10,40,0.1, 7.6,46.05);
[givenMass1, gjennom1, masse1,deltam1,snitt1] = deltaM(10,40,0.5, 4,35);

hold on
plot(givenMass,gjennom)         %Plott av hvilket partikler som kom gjennom
plot(givenMass1,gjennom1,'r')
ylim([0,1.1])
title('Partikkel gjennom sensoren s.f.m. massen og spenningen')
xlabel('masse (u)')
ylabel('Partikler som når gjennom sensor')
legend('Vdc = 7.6, Vac = 46.05','Vdc = 4, Vac = 35')