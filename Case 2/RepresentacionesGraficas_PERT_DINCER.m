function [ISEFcomb_ordenado,ISSFcomb_ordenado,ISMFcomb_ordenado,ISFcomb_ordenado,ISEFelec_ordenado,ISSFelec_ordenado,ISMFelec_ordenado,ISFelec_ordenado,ISEFHEV_ordenado,ISSFHEV_ordenado,ISMFHEV_ordenado,ISFHEV_ordenado,ISEFPHEV_ordenado,ISSFPHEV_ordenado,ISMFPHEV_ordenado,ISFPHEV_ordenado]=RepresentacionesGraficas_PERT_DINCER
%[strE,strS,strM,str,MediaISE,DesvISE,VarISE,MinimoISE,MaximoISE,MediaISS,DesvISS,VarISS,MinimoISS,MaximoISS,MediaISM,DesvISM,VarISM,MinimoISM,MaximoISM,MediaIS,DesvIS,VarIS,MinimoIS,MaximoIS,ISEcomb,ISScomb,ISMcomb,IScomb]=CocheCombProbabilistaCorrelacionado;
%[strE,strS,strM,str,MediaISE,DesvISE,VarISE,MinimoISE,MaximoISE,MediaISS,DesvISS,VarISS,MinimoISS,MaximoISS,MediaISM,DesvISM,VarISM,MinimoISM,MaximoISM,MediaIS,DesvIS,VarIS,MinimoIS,MaximoIS,ISEelec,ISSelec,ISMelec,ISelec]=CocheElecProbabilistaCorrelacionado;

[strE,strS,strM,str,MediaISE,DesvISE,VarISE,MinimoISE,MaximoISE,MediaISS,DesvISS,VarISS,MinimoISS,MaximoISS,MediaISM,DesvISM,VarISM,MinimoISM,MaximoISM,MediaIS,DesvIS,VarIS,MinimoIS,MaximoIS,ISEcomb,ISScomb,ISMcomb,IScomb]=CocheCombProbabilistaCorrelacionado_28_03_2025_PERT_DINCER;
[strE,strS,strM,str,MediaISE,DesvISE,VarISE,MinimoISE,MaximoISE,MediaISS,DesvISS,VarISS,MinimoISS,MaximoISS,MediaISM,DesvISM,VarISM,MinimoISM,MaximoISM,MediaIS,DesvIS,VarIS,MinimoIS,MaximoIS,ISEelec,ISSelec,ISMelec,ISelec]=CocheElecProbabilistaCorrelacionado_28_03_2025_PERT_DINCER;
[strE,strS,strM,str,MediaISE,DesvISE,VarISE,MinimoISE,MaximoISE,MediaISS,DesvISS,VarISS,MinimoISS,MaximoISS,MediaISM,DesvISM,VarISM,MinimoISM,MaximoISM,MediaIS,DesvIS,VarIS,MinimoIS,MaximoIS,ISEHEV,ISSHEV,ISMHEV,ISHEV]=CocheHEVProbabilistaCorrelacionado_28_03_2025_PERT_DINCER;
[strE,strS,strM,str,MediaISE,DesvISE,VarISE,MinimoISE,MaximoISE,MediaISS,DesvISS,VarISS,MinimoISS,MaximoISS,MediaISM,DesvISM,VarISM,MinimoISM,MaximoISM,MediaIS,DesvIS,VarIS,MinimoIS,MaximoIS,ISEPHEV,ISSPHEV,ISMPHEV,ISPHEV]=CochePHEVProbabilistaCorrelacionado_28_03_2025_PERT_DINCER;

ISEFcomb_ordenado=sort(ISEcomb,'descend');
ISSFcomb_ordenado=sort(ISScomb,'descend');
ISMFcomb_ordenado=sort(ISMcomb,'descend');
ISFcomb_ordenado=sort(IScomb,'descend');

ISEFelec_ordenado=sort(ISEelec,'descend');
ISSFelec_ordenado=sort(ISSelec,'descend');
ISMFelec_ordenado=sort(ISMelec,'descend');
ISFelec_ordenado=sort(ISelec,'descend');

ISEFHEV_ordenado=sort(ISEHEV,'descend');
ISSFHEV_ordenado=sort(ISSHEV,'descend');
ISMFHEV_ordenado=sort(ISMHEV,'descend');
ISFHEV_ordenado=sort(ISHEV,'descend');

ISEFPHEV_ordenado=sort(ISEPHEV,'descend');
ISSFPHEV_ordenado=sort(ISSPHEV,'descend');
ISMFPHEV_ordenado=sort(ISMPHEV,'descend');
ISFPHEV_ordenado=sort(ISPHEV,'descend');

salto=100/(100000);
ISF_num=0:salto:(100-salto);

hold on
    plot(ISFcomb_ordenado,ISF_num,'linewidth',2);
    plot(ISFelec_ordenado,ISF_num,'linewidth',2);
    %plot(ISFHEV_ordenado,ISF_num,'linewidth',2);
    %plot(ISFPHEV_ordenado,ISF_num,'linewidth',2);
    %plot([R1(1) R3(1)],[R1(2) R3(2)],'b','linewidth',2);
    %plot([R2(1) R4(1)],[R2(2) R4(2)],'b','linewidth',2);
    axis auto
    axis ([0 1 0 100.5])
    grid
    %title ('Cumulative probability curves')
    xlabel ('SI')
    ylabel ('Probability')
    legend("Conventional","EV")
hold off

figure(2)
hold on
    plot(ISEFcomb_ordenado,ISF_num,'linewidth',2);
    plot(ISEFelec_ordenado,ISF_num,'linewidth',2);
    %plot(ISEFHEV_ordenado,ISF_num,'linewidth',2);
    %plot(ISEFPHEV_ordenado,ISF_num,'linewidth',2);
    axis auto
    axis ([0 1 0 100.5])
    grid
    %title ('Cumulative probability curves')
    xlabel ('EI')
    ylabel ('Probability')
    legend("Conventional","EV")
hold off

figure(3)
hold on
    plot(ISSFcomb_ordenado,ISF_num,'linewidth',2);
    plot(ISSFelec_ordenado,ISF_num,'linewidth',2);
    %plot(ISSFHEV_ordenado,ISF_num,'linewidth',2);
    %plot(ISSFPHEV_ordenado,ISF_num,'linewidth',2);
    axis auto
    axis ([0 1 0 100.5])
    grid
    %title ('Cumulative probability curves')
    xlabel ('SOI')
    ylabel ('Probability')
    legend("Conventional","EV")
hold off

figure(4)
hold on
    plot(ISMFcomb_ordenado,ISF_num,'linewidth',2);
    plot(ISMFelec_ordenado,ISF_num,'linewidth',2);
    %plot(ISMFHEV_ordenado,ISF_num,'linewidth',2);
    %plot(ISMFPHEV_ordenado,ISF_num,'linewidth',2);
    axis auto
    axis ([0 1 0 100.5])
    grid
    %title ('Cumulative probability curves')
    xlabel ('ENI')
    ylabel ('Probability')
    legend("Conventional","EV")
hold off

A=[0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0];
figure(5)
hold on
    histogram(ISFcomb_ordenado,A);
    histogram(ISFelec_ordenado,A);
    %histogram(ISFHEV_ordenado,30);
    %histogram(ISFPHEV_ordenado,30);
    axis auto
    %axis ([0 1 0 100.5])
    grid
    xlabel ('SI')
    ylabel ('Frequency')
    legend("Conventional","EV")
hold off

figure(6)
hold on
    histogram(ISEFcomb_ordenado,A);
    histogram(ISEFelec_ordenado,A);
    %histogram(ISEFHEV_ordenado,30);
    %histogram(ISEFPHEV_ordenado,30);
    axis auto
    %axis ([0 1 0 100.5])
    grid
    xlabel ('EI')
    ylabel ('Frequency')
    legend("Conventional","EV")
hold off

figure(7)
hold on
    histogram(ISSFcomb_ordenado,A);
    histogram(ISSFelec_ordenado,A);
    %histogram(ISSFHEV_ordenado,30);
    %histogram(ISSFPHEV_ordenado,30);
    axis auto
    %axis ([0 1 0 100.5])
    grid
    xlabel ('SOI')
    ylabel ('Frequency')
    legend("Conventional","EV")
hold off

figure(8)
hold on
    histogram(ISMFcomb_ordenado,A);
    histogram(ISMFelec_ordenado,A);
    %histogram(ISMFHEV_ordenado,30);
    %histogram(ISMFPHEV_ordenado,30);
    axis auto
    %axis ([0 1 0 100.5])
    grid
    xlabel ('ENI')
    ylabel ('Frequency')
    legend("Conventional","EV")
hold off

