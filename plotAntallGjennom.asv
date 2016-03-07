%Plotte alle partiklene som kommer gjennom som funksjon av forskjellige
%masser
function plotAntallGjennom()
prosentGjennom=zeros(1,3);
j = 1;
for i = 27:1:29
    prosentGjennom(j) = randomSuccess(i,50,7.65,46);
    j = j+1;
end

t = 27:1:29;
plot(t,prosentGjennom) %Plotter prosentandelen som kom frem til sensoren
ylim([0,1])