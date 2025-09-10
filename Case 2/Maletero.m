function V=Maletero(Vol,A1,A2,A3)

if Vol<250
    Aux1=0;
else
    if Vol>500
        Aux1=1;
    else
        Aux1=(Vol/250)-1;
    end
end

V=(200*Aux1+A1*50+A2*30+A3*10)/(200+50+30+10);