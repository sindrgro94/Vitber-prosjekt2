%%Mainfila
alternative = menu('What to do?','Teste Euler mot Analytisk','TestRK4Voltage');
switch alternative
    case 1
        testEulerVSAnalytic;
    case 2
        TestRK4Voltage;
end