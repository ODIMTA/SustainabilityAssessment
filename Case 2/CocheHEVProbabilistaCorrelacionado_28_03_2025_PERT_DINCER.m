function [strE,strS,strM,str,MediaISE,DesvISE,VarISE,MinimoISE,MaximoISE,MediaISS,DesvISS,VarISS,MinimoISS,MaximoISS,MediaISM,DesvISM,VarISM,MinimoISM,MaximoISM,MediaIS,DesvIS,VarIS,MinimoIS,MaximoIS,ISE,ISS,ISM,IS]=CocheHEVProbabilistaCorrelacionado_28_03_2025_PERT_DINCER

% Voy a realizar 100.000 iteraciones
n=100000;

% Precio de compra (SOCIAL), mantenimiento y reparación, e ITV, seguro e IC
% correlacionados

Rho=[1 0.8 0.8; 0.8 1 0.8; 0.8 0.8 1];
u=copularnd('Gaussian',Rho,n);

[aPCOM,bPCOM]=betaPERT(16690,29000,139500);
[aCMR,bCMR]=betaPERT(350,550,1800);
[aCITV,bCITV]=betaPERT(160,325,1100);
pdPCOM=makedist('beta',aPCOM,bPCOM);
pdCMR=makedist('beta',aCMR,bCMR);
pdCITV=makedist('beta',aCITV,bCITV);

X=[icdf(pdPCOM,u(:,1)) icdf(pdCMR,u(:,2)) icdf(pdCITV,u(:,3))];

Y(:,1)=X(:,1)*(139500-16690)+16690;
Y(:,2)=X(:,2)*(1800-350)+350;
Y(:,3)=X(:,3)*(1100-160)+160;

for i=1:n
    V_PCOM(i)=FVcontinua(Y(i,1),15000,150000,68500,1.3,1.6,"creciente");    
    V_CMR(i)=FVcontinua(Y(i,2),1000,300,480,0.9,3.2,"decreciente");
    V_CITV(i)=FVcontinua(Y(i,3),650,250,610,0.01,1,"decreciente");
end

% Coste de inversión
[aCI,bCI]=betaPERT(0.50,19.12,62.00);
pdCI=makedist('beta',aCI,bCI);
CI_aux=random(pdCI,1,n);
CI=CI_aux*(62.00-0.50)+0.50;

% Comprobación correlaciones
%[pho,p]=corr(X,'Type','spearman');

% Coste de consumo
[aCC,bCC]=betaPERT(0.06,0.07,0.17);
pdCC=makedist('beta',aCC,bCC);
CC_aux=random(pdCC,1,n);
CC=CC_aux*(0.17-0.06)+0.06;

% Depreciación tras primer año en %
[aPVFU,bPVFU]=betaPERT(9,23,38);
pdPVFU=makedist('beta',aPVFU,bPVFU);
PVFU_aux=random(pdPVFU,1,n);
PVFU=PVFU_aux*(38-9)+9;

for i=1:n
    V_CI(i)=FVcontinua(CI(i),24,6,11,0.7,3.5,"decreciente");
    V_CC(i)=FVcontinua(CC(i),0.12,0.02,0.12,0.01,1,"decreciente");
    V_PVFU(i)=FVcontinua(PVFU(i),30,10,11,0.8,2.5,"decreciente");    
end

% Definición de pesos para el pilar económico.
% Pesos indicadores:
PCI=1;
PCMR=0.3332;
PCITV=0.1184;
PCC=0.5484;
PPVFU=1;

% Pesos criterios económicos:
PCriterioCI=0.3752;
PCriterioUso=0.4915;
PCriterioVResidual=0.1333;

% Cálculo índice sostenibilidad económico (entre 0 y 1, falta considerar peso requerimiento):
for i=1:n
    ISE(i)=PCriterioCI*PCI*V_CI(i)+PCriterioUso*(PCMR*V_CMR(i)+PCITV*V_CITV(i)+PCC*V_CC(i))+PCriterioVResidual*PPVFU*V_PVFU(i);
end

% Indicadores de seguridad con correlaciones
Rho2=[1 0.8 0.8 0.8; 0.8 1 0.8 0.8; 0.8 0.8 1 0.8; 0.8 0.8 0.8 1];
v=copularnd('Gaussian',Rho2,n);
[aSOA,bSOA]=betaPERT(70,83,92);
[aSON,bSON]=betaPERT(80,87,90);
[aUVC,bUVC]=betaPERT(60,85,86);
[aASC,bASC]=betaPERT(57,76,87);

pdSOA=makedist('beta',aSOA,bSOA);
pdSON=makedist('beta',aSON,bSON);
pdUVC=makedist('beta',aUVC,bUVC);
pdASC=makedist('beta',aASC,bASC);
Z=[icdf(pdSOA,v(:,1)) icdf(pdSON,v(:,2)) icdf(pdUVC,v(:,3)) icdf(pdASC,v(:,4))];

ZZ(:,1)=Z(:,1)*(92-70)+70;
ZZ(:,2)=Z(:,2)*(90-80)+80;
ZZ(:,3)=Z(:,3)*(86-60)+60;
ZZ(:,4)=Z(:,4)*(87-57)+57;

for i=1:n
   V_SOA(i)=FVcontinua(ZZ(i,1),20,100,50,1,4.9,"creciente");
   V_SON(i)=FVcontinua(ZZ(i,2),20,100,50,1,4.9,"creciente");
   V_UVC(i)=FVcontinua(ZZ(i,3),10,100,50,0.98,4.9,"creciente");
   V_ASC(i)=FVcontinua(ZZ(i,4),10,100,50,0.98,4.9,"creciente");
end

% Comprobación correlaciones
%[pho2,p2]=corr(Y,'Type','spearman');

% Pesos de los indicadores pertenecientes al criterio de "seguridad":
PSOA=0.2731;
PSON=0.3152;
PUVC=0.2661;
PASC=0.1456;
% Cálculo del nivel de satisfacción asociado al criterio de "seguridad":
for i=1:n
    V_Seguridad(i)=PSOA*V_SOA(i)+PSON*V_SON(i)+PUVC*V_UVC(i)+PASC*V_ASC(i);
end

% Número de plazas.
%NP=random("unid",6,1,n);
pdNP=makedist('Multinomial','Probabilities',[3/100 3/100 7/100 70/100 7/100 10/100]);
NP=random(pdNP,1,n);
% Número de puertas para pasajeros.
pdNPP=makedist('Multinomial','Probabilities',[5/100 95/100]);
NPP=random(pdNPP,1,n);
% Altura acceso asientos y plataforma.
pdAAA=makedist('Multinomial','Probabilities',[0.5/100 50/100 0.5/100 49/100]);
AAA=random(pdAAA,1,n);
% Comodidad de amortiguación.
pdCA=makedist('Multinomial','Probabilities',[5/100 5/100 90/100]);
CA=random(pdCA,1,n);
% Capacidad y comodidad del maletero. Defino una función específica para
% este indicador.
% Volumen del maletero en l:
[aVol,bVol]=betaPERT(197,300,711);
pdVol=makedist('beta',aVol,bVol);
Vol_aux=random(pdVol,1,n);
Vol=Vol_aux*(711-197)+197;

pdAux1=makedist('Multinomial','Probabilities',[80/100 20/100]);
pdAux2=makedist('Multinomial','Probabilities',[95/100 5/100]);
pdAux3=makedist('Multinomial','Probabilities',[10/100 90/100]);
for i=1:n
    Auxiliar1(i)=random(pdAux1);
    Auxiliar2(i)=random(pdAux2);
    Auxiliar3(i)=random(pdAux3);
end

pdNCA=makedist('Multinomial','Probabilities',[0/100 5/100 94.9/100 0.1/100 0/100 0/100]);
NCA=random(pdNCA,1,n);

% Acceso a zonas urbanas.
pdAZU=makedist('Multinomial','Probabilities',[100/100 0/100]);
AZU=random(pdAZU,1,n);
% Estaciones de repostaje
ER=1;
% Velocidad de repostaje en minutos.
pdVR=makedist('uniform',5,10);
VR=random(pdVR,1,n);
% Autonomía medida en km.
[aAUT,bAUT]=betaPERT(590,930,1200);
pdAUT=makedist('beta',aAUT,bAUT);
AUT_aux=random(pdAUT,1,n);
AUT=AUT_aux*(1200-590)+590;

for i=1:n
    V_NP(i)=FVdiscreta2(NP(i),[0.1 0.3 0.5 0.7 0.9 1]);
    V_NPP(i)=FVdiscreta2(NPP(i),[0.1 1]);
    V_AAA(i)=FVdiscreta2(AAA(i),[0.1 1 0.5 0.7]);
    V_CA(i)=FVdiscreta2(CA(i),[0.2 1 0.8]);
    V_CCM(i)=Maletero(Vol(i),Auxiliar1(i),Auxiliar2(i),Auxiliar3(i));
    V_NCA(i)=FVdiscreta2(NCA(i),[0 0.35 0.75 1 1 1]);
    V_AZU(i)=FVdiscreta2(AZU(i),[1 0]);
    V_ER(i)=FVdiscreta2(ER,[1 0.4 0]);
    V_VR(i)=FVcontinua(VR(i),30,10,20,0.8,2.2,"decreciente");
    V_AUT(i)=FVcontinua(AUT(i),400,700,430,0.01,1,"creciente");
end

% Par y potencia con correlaciones
Rho3=[1 0.8; 0.8 1];
w=copularnd('Gaussian',Rho3,n);
[aPM,bPM]=betaPERT(0.10,0.12,0.31);
[aPP,bPP]=betaPERT(0.065,0.092,0.164);
pdPM=makedist('beta',aPM,bPM);
pdPP=makedist('beta',aPP,bPP);
MM=[icdf(pdPM,w(:,1)) icdf(pdPP,w(:,2))];
MMM(:,1)=MM(:,1)*(0.31-0.10)+0.10;
MMM(:,2)=MM(:,2)*(0.164-0.065)+0.065;
for i=1:n
   V_PM(i)=FVcontinua(MMM(i,1),0.1,0.2,0.105,1.8,1.8,"creciente");
   V_PP(i)=FVcontinua(MMM(i,2),0.06,0.2,0.105,1,1.8,"creciente");   
end
% Comprobación correlaciones
%[pho3,p3]=corr(Z,'Type','spearman');

% Pesos de los indicadores pertenecientes al criterio de "funcionalidad":
PNP=0.1126;
PNPP=0.0734;
PAAA=0.0483;
PCA=0.0412;
PCCM=0.0624;
PNCA=0.0417;
PAZU=0.0740;
PPM=0.1105;
PPP=0.0981;
PER=0.1044;
PVR=0.1081;
PAUT=0.1253;
% Cálculo del nivel de satisfacción asociado al criterio de
% "funcionalidad":
for i=1:n
    V_Funcionalidad(i)=PNP*V_NP(i)+PNPP*V_NPP(i)+PAAA*V_AAA(i)+PCA*V_CA(i)+PCCM*V_CCM(i)+PNCA*V_NCA(i)+PAZU*V_AZU(i)+PPM*V_PM(i)+PPP*V_PP(i)+PER*V_ER(i)+PVR*V_VR(i)+PAUT*V_AUT(i);
end

% Lugar de fabricación.
pdFABR=makedist('Multinomial','Probabilities',[30/100 50/100 20/100]);
FABR=random(pdFABR,1,n);
% Peso del indicador perteneciente al criterio de "empleo".
PFABR=1;

for i=1:n
    V_FABR(i)=FVdiscreta2(FABR(i),[1 0.6 0]);
    % Cálculo del nivel de satisfacción asociado al criterio de "empleo".
    V_Empleo(i)=PFABR*V_FABR(i);
end

% Diseño. El usuario introduce directamente un valor entre 0 y 1 para
% indicar su satisfacción con un diseño en concreto.
pdDIS=makedist('uniform',0,1);
V_DIS=random(pdDIS,1,n);

% Peso del indicador perteneciente al criterio de "diseño".
PDIS=1;

% Cálculo del nivel de satisfacción asociado al criterio de "diseño".
for i=1:n
    V_Diseno(i)=PDIS*V_DIS(i);
end

% Marca (asociado a estatus social).
pdMARCA=makedist('Multinomial','Probabilities',[2.5/100 95/100 2.5/100]);
MARCA=random(pdMARCA,1,n);
% Tamaño (asociado a estatus social). 
pdTAM=makedist('Multinomial','Probabilities',[1/100 10/100 40/100 30/100 19/100]);
TAM=random(pdTAM,1,n);

for i=1:n
    V_MARCA(i)=FVdiscreta2(MARCA(i),[0 0.5 1]);
    V_TAM(i)=FVdiscreta2(TAM(i),[1 0.7 0.4 0.2 0]);
end

% Peso de los indicadores pertenecientes al criterio de "estatus social".
PMARCA=0.4719;
PTAM=0.3319;
PPCOM=0.1962;

% Cálculo del nivel de satisfacción asociado al criterio de "estatus
% social".
for i=1:n
    V_Estatus(i)=PMARCA*V_MARCA(i)+PTAM*V_TAM(i)+PPCOM*V_PCOM(i);
end

% Pesos criterios sociales:
PCriterioSeguridad=0.3116;
PCriterioFuncionalidad=0.2821;
PCriterioEmpleo=0.1132;
PCriterioDiseno=0.2296;
PCriterioEstatus=0.0635;
% Cálculo índice sostenibilidad social (entre 0 y 1, falta considerar peso requerimiento):
for i=1:n
    ISS(i)=PCriterioSeguridad*V_Seguridad(i)+PCriterioFuncionalidad*V_Funcionalidad(i)+PCriterioEmpleo*V_Empleo(i)+PCriterioDiseno*V_Diseno(i)+PCriterioEstatus*V_Estatus(i);
end

pdECO=makedist('uniform',19.5,25.5);
ECO=random(pdECO,1,n);

for i=1:n
   V_ECO(i)=FVcontinua(ECO(i),28,8,1,0.01,1,"decreciente");   
end

% Pesos de los indicadores medioambientales:
PECO=1;
% Peso del criterio mediambiental:
PCriterioMedioambiental=1;
% Pesos de los requerimientos:
PEconomico=0.3289;
PSocial=0.3311;
PMedioambiental=0.34;

for i=1:n
    % Cálculo índice sostenibilidad medioambiental (entre 0 y 1, falta considerar peso requerimiento):
    ISM(i)=PCriterioMedioambiental*(PECO*V_ECO(i));
    % Cálculo del índice de sostenibilidad:
    IS(i)=PEconomico*ISE(i)+PSocial*ISS(i)+PMedioambiental*ISM(i);
end

% A continuación, vamos a calcular ciertos parámetros estadísticos
MediaISE=mean(ISE);
DesvISE=std(ISE);
VarISE=var(ISE);
MinimoISE=min(ISE);
MaximoISE=max(ISE);

MediaISS=mean(ISS);
DesvISS=std(ISS);
VarISS=var(ISS);
MinimoISS=min(ISS);
MaximoISS=max(ISS);

MediaISM=mean(ISM);
DesvISM=std(ISM);
VarISM=var(ISM);
MinimoISM=min(ISM);
MaximoISM=max(ISM);

MediaIS=mean(IS);
DesvIS=std(IS);
VarIS=var(IS);
MinimoIS=min(IS);
MaximoIS=max(IS);

%------------------------------------------------------------------------
% REPRESENTACIONES GRÁFICAS
%------------------------------------------------------------------------

%Vamos a representar la curva de probabilidad acumulada. Para ello, es
%interesante ordenar el vector ISE.
% La función sort ordena los valores de un vector de la forma especificada
ISEF_ordenado=sort(ISE,'descend');
ISSF_ordenado=sort(ISS,'descend');
ISMF_ordenado=sort(ISM,'descend');
ISF_ordenado=sort(IS,'descend');
salto=100/(n);
ISF_num=0:salto:(100-salto);

% R1,R2,R3 y R4 no son estrictamente necesarios para representar la curva
% de probabilidad acumulada. Sin embargo, sirven para representar las
% rectas horizontales para probabilidades del 0 y el 100%.
%R1=[0 100];
%R2=[1 0];
%R3=[MinimoIS 100];
%R4=[MaximoIS 0];

%hold on
%    plot(ISEF_ordenado,ISF_num,'linewidth',2);
%    plot(ISSF_ordenado,ISF_num,'linewidth',2);
%    plot(ISMF_ordenado,ISF_num,'linewidth',2);
%    plot(ISF_ordenado,ISF_num,'b','linewidth',2);
    %plot([R1(1) R3(1)],[R1(2) R3(2)],'b','linewidth',2);
    %plot([R2(1) R4(1)],[R2(2) R4(2)],'b','linewidth',2);
%    axis auto
%    axis ([0 1 0 100.5])
%    grid
%    title ('Curva de probabilidad acumulada')
%    xlabel ('Índices')
%    ylabel ('Probabilidad')
%    legend("ISE","ISS","ISM","IS")
%hold off

% Histograma de frecuencias. 
% Histc cuenta el número de elementos que pertenecen a cada uno de los
% intervalos definidos en el vector (el extremo de la izquierda queda
% dentro (<=), mientras que el extremo de la derecha queda fuera (<)). Como
% consecuencia de esto, la función histc reserva un último intervalo
% (adicional a los introducidos por el usuario) para contar aquellos
% elemenos que coinciden exactamente con el extremo derecho del último
% intervalo.

NE=histc(ISE,[0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1]);
NS=histc(ISS,[0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1]);
NM=histc(ISM,[0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1]);
N=histc(IS,[0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1]);

% Para eliminar el último intervalo de N, generamos un nuevo vector
% (Nnuevo) que es igual que N para las 9 primeras posiciones, y que para la
% décima posición (intervalo entre 0.9 y 1) es igual a la suma de los
% intervalos 10 y 11 de N. De esta forma, tenemos un vector que nos indica
% cuantos índices de sostenibilidad se han generado en cada uno de los 10
% intervalos (de 0 a 0.1, de 0.1 a 0.2, de 0.2 a 0.3, etc.). Dividimos
% entre Iteraciones y multiplicamos por 100 para hacer una representación
% porcentual
for l=1:9
    NnuevoE(l)=100*(NE(l)/n);
    NnuevoS(l)=100*(NS(l)/n);
    NnuevoM(l)=100*(NM(l)/n);
    Nnuevo(l)=100*(N(l)/n);
end
NnuevoE(10)=(100*(NE(10)+NE(11)))/n;
NnuevoS(10)=(100*(NS(10)+NS(11)))/n;
NnuevoM(10)=(100*(NM(10)+NM(11)))/n;
Nnuevo(10)=(100*(N(10)+N(11)))/n;

% Con la siguiente línea identificamos el número de intervalo (Columna) en
% el que se encuentra el máximo, es decir el mayor porcentaje de aparición
% de índices de sostenibilidad
[FilaE,ColumnaE]=find(NnuevoE==max(max(NnuevoE)));
[FilaS,ColumnaS]=find(NnuevoS==max(max(NnuevoS)));
[FilaM,ColumnaM]=find(NnuevoM==max(max(NnuevoM)));
[Fila,Columna]=find(Nnuevo==max(max(Nnuevo)));

% Mostramos un mensaje por pantalla en el que se indica el intervalo de
% índices de sostenibilidad con mayor frecuencia, así como el porcentaje.
if ColumnaE==1
    strE=sprintf('El intervalo [0.0-0.1) es el de mayor frecuencia para el ISE, con un porcentaje del %2.4f %',max(NnuevoE));
end
if ColumnaE==2
    strE=sprintf('El intervalo [0.1-0.2) es el de mayor frecuencia para el ISE, con un porcentaje del %2.4f %',max(NnuevoE));
end
if ColumnaE==3
    strE=sprintf('El intervalo [0.2-0.3) es el de mayor frecuencia para el ISE, con un porcentaje del %2.4f %',max(NnuevoE));
end
if ColumnaE==4
    strE=sprintf('El intervalo [0.3-0.4) es el de mayor frecuencia para el ISE, con un porcentaje del %2.4f %',max(NnuevoE));
end
if ColumnaE==5
    strE=sprintf('El intervalo [0.4-0.5) es el de mayor frecuencia para el ISE, con un porcentaje del %2.4f %',max(NnuevoE));
end
if ColumnaE==6
    strE=sprintf('El intervalo [0.5-0.6) es el de mayor frecuencia para el ISE, con un porcentaje del %2.4f %',max(NnuevoE));
end
if ColumnaE==7
    strE=sprintf('El intervalo [0.6-0.7) es el de mayor frecuencia para el ISE, con un porcentaje del %2.4f %',max(NnuevoE));
end
if ColumnaE==8
    strE=sprintf('El intervalo [0.7-0.8) es el de mayor frecuencia para el ISE, con un porcentaje del %2.4f %',max(NnuevoE));
end
if ColumnaE==9
    strE=sprintf('El intervalo [0.8-0.9) es el de mayor frecuencia para el ISE, con un porcentaje del %2.4f %',max(NnuevoE));
end
if ColumnaE==10
    strE=sprintf('El intervalo [0.9-1] es el de mayor frecuencia para el ISE, con un porcentaje del %2.4f %',max(NnuevoE));
end

if ColumnaS==1
    strS=sprintf('El intervalo [0.0-0.1) es el de mayor frecuencia para el ISS, con un porcentaje del %2.4f %',max(NnuevoS));
end
if ColumnaS==2
    strS=sprintf('El intervalo [0.1-0.2) es el de mayor frecuencia para el ISS, con un porcentaje del %2.4f %',max(NnuevoS));
end
if ColumnaS==3
    strS=sprintf('El intervalo [0.2-0.3) es el de mayor frecuencia para el ISS, con un porcentaje del %2.4f %',max(NnuevoS));
end
if ColumnaS==4
    strS=sprintf('El intervalo [0.3-0.4) es el de mayor frecuencia para el ISS, con un porcentaje del %2.4f %',max(NnuevoS));
end
if ColumnaS==5
    strS=sprintf('El intervalo [0.4-0.5) es el de mayor frecuencia para el ISS, con un porcentaje del %2.4f %',max(NnuevoS));
end
if ColumnaS==6
    strS=sprintf('El intervalo [0.5-0.6) es el de mayor frecuencia para el ISS, con un porcentaje del %2.4f %',max(NnuevoS));
end
if ColumnaS==7
    strS=sprintf('El intervalo [0.6-0.7) es el de mayor frecuencia para el ISS, con un porcentaje del %2.4f %',max(NnuevoS));
end
if ColumnaS==8
    strS=sprintf('El intervalo [0.7-0.8) es el de mayor frecuencia para el ISS, con un porcentaje del %2.4f %',max(NnuevoS));
end
if ColumnaS==9
    strS=sprintf('El intervalo [0.8-0.9) es el de mayor frecuencia para el ISS, con un porcentaje del %2.4f %',max(NnuevoS));
end
if ColumnaS==10
    strS=sprintf('El intervalo [0.9-1] es el de mayor frecuencia para el ISS, con un porcentaje del %2.4f %',max(NnuevoS));
end

if ColumnaM==1
    strM=sprintf('El intervalo [0.0-0.1) es el de mayor frecuencia para el ISM, con un porcentaje del %2.4f %',max(NnuevoM));
end
if ColumnaM==2
    strM=sprintf('El intervalo [0.1-0.2) es el de mayor frecuencia para el ISM, con un porcentaje del %2.4f %',max(NnuevoM));
end
if ColumnaM==3
    strM=sprintf('El intervalo [0.2-0.3) es el de mayor frecuencia para el ISM, con un porcentaje del %2.4f %',max(NnuevoM));
end
if ColumnaM==4
    strM=sprintf('El intervalo [0.3-0.4) es el de mayor frecuencia para el ISM, con un porcentaje del %2.4f %',max(NnuevoM));
end
if ColumnaM==5
    strM=sprintf('El intervalo [0.4-0.5) es el de mayor frecuencia para el ISM, con un porcentaje del %2.4f %',max(NnuevoM));
end
if ColumnaM==6
    strM=sprintf('El intervalo [0.5-0.6) es el de mayor frecuencia para el ISM, con un porcentaje del %2.4f %',max(NnuevoM));
end
if ColumnaM==7
    strM=sprintf('El intervalo [0.6-0.7) es el de mayor frecuencia para el ISM, con un porcentaje del %2.4f %',max(NnuevoM));
end
if ColumnaM==8
    strM=sprintf('El intervalo [0.7-0.8) es el de mayor frecuencia para el ISM, con un porcentaje del %2.4f %',max(NnuevoM));
end
if ColumnaM==9
    strM=sprintf('El intervalo [0.8-0.9) es el de mayor frecuencia para el ISM, con un porcentaje del %2.4f %',max(NnuevoM));
end
if ColumnaM==10
    strM=sprintf('El intervalo [0.9-1] es el de mayor frecuencia para el ISM, con un porcentaje del %2.4f %',max(NnuevoM));
end

if Columna==1
    str=sprintf('El intervalo [0.0-0.1) es el de mayor frecuencia para el IS, con un porcentaje del %2.4f %',max(Nnuevo));
end
if Columna==2
    str=sprintf('El intervalo [0.1-0.2) es el de mayor frecuencia para el IS, con un porcentaje del %2.4f %',max(Nnuevo));
end
if Columna==3
    str=sprintf('El intervalo [0.2-0.3) es el de mayor frecuencia para el IS, con un porcentaje del %2.4f %',max(Nnuevo));
end
if Columna==4
    str=sprintf('El intervalo [0.3-0.4) es el de mayor frecuencia para el IS, con un porcentaje del %2.4f %',max(Nnuevo));
end
if Columna==5
    str=sprintf('El intervalo [0.4-0.5) es el de mayor frecuencia para el IS, con un porcentaje del %2.4f %',max(Nnuevo));
end
if Columna==6
    str=sprintf('El intervalo [0.5-0.6) es el de mayor frecuencia para el IS, con un porcentaje del %2.4f %',max(Nnuevo));
end
if Columna==7
    str=sprintf('El intervalo [0.6-0.7) es el de mayor frecuencia para el IS, con un porcentaje del %2.4f %',max(Nnuevo));
end
if Columna==8
    str=sprintf('El intervalo [0.7-0.8) es el de mayor frecuencia para el IS, con un porcentaje del %2.4f %',max(Nnuevo));
end
if Columna==9
    str=sprintf('El intervalo [0.8-0.9) es el de mayor frecuencia para el IS, con un porcentaje del %2.4f %',max(Nnuevo));
end
if Columna==10
    str=sprintf('El intervalo [0.9-1] es el de mayor frecuencia para el IS, con un porcentaje del %2.4f %',max(Nnuevo));
end
% Representamos el histograma de frecuencias. Para representarlo en una
% figura distinta es necesario introducir el comando figure(2).
%figure(2);
%hold on
%    bar(NnuevoE)
%    bar(NnuevoS)
%    bar(NnuevoM)
%    bar(Nnuevo)
%    axis ([0 11 0 100.5])
%    grid
%    title ('Histograma de frecuencias')
%    xlabel ('Intervalos')
%    ylabel ('Frecuencia (%)')
%    legend("ISE","ISS","ISM","IS")
%hold off


