%%Mainfila
alternative = menu('Hva skal testes?',...
    'Teste Euler mot Analytisk',...
    'Finne stabilitetsdiagram for spenningen'...
    'Plotte 1 stabil og 1 ustabil bane');
switch alternative
    case 1
        testEulerVSAnalytic;
    case 2
        TestRK4Voltage();
    case 3
        plotStableAndUnstable;
end