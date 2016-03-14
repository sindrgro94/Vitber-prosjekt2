%Plotte alle partiklene som kommer gjennom som funksjon av forskjellige
%masser
function plotAntallGjennom()
%Kjør fra 27.6 og til 28.6 med mange verdier. Anbefaler å kjøre mellom 50
%og 100 verdier. Bruk et massesteg på 0.01 eller 0.05
prosentGjennom=zeros(1,100);
j = 1;
for i = 27.5:0.01:28.7
    prosentGjennom(j) = randomSuccess(i,200,7.65,46);
    j = j+1;
end
prosentGjennom = prosentGjennom*100;
t = 27.5:0.01:28.7;
hold on
fig = figure();
plot(t,prosentGjennom) %Plotter prosentandelen som kom frem til sensoren
title('Prosent treff s.f.a massen')
xlabel('masse (u)')
ylabel('Prosent')
ylim([0,1])

saveTightFigure(fig,'normalfordeling3')