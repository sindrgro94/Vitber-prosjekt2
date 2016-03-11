%Plotte alle partiklene som kommer gjennom som funksjon av forskjellige
%masser
function plotAntallGjennom()
%Kjør fra 27.6 og til 28.6 med mange verdier. Anbefaler å kjøre mellom 50
%og 100 verdier. Bruk et massesteg på 0.01 eller 0.05
%prosentGjennom=zeros(1,20);
j = 1;
for i = 27.6:0.1:28.6
    prosentGjennom(j) = randomSuccess(i,20,7.65,46);
    j = j+1;
end

t = 27.6:0.1:28.6;
plot(t,prosentGjennom) %Plotter prosentandelen som kom frem til sensoren
ylim([0,1])