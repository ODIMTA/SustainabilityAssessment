function [ISE,ISS,ISM,IS]=SostenibilidadOpelAstra_18_03_2025_Dincer

% DATOS Opel Astra

% Función para evaluar la sostenibilidad de vehículos automóviles.
% Función preliminar para hacer pruebas.
% Mucha de la información definida sobre la propia función serán datos
% pedidos al usuario, una vez se compruebe que funciona.

% PILAR ECONÓMICO

% Coste de inversión (coste de compra). Se mide en meses de salario neto.
CI=21.16;
V_CI=FVcontinua(CI,24,6,11,0.7,3.5,"decreciente");

% Coste de mantenimiento y reparación en €/año.
CMR=580;
V_CMR=FVcontinua(CMR,1000,300,480,0.9,3.2,"decreciente");

% Coste de ITV, seguro e IC en €/año.
CITV=480;
V_CITV=FVcontinua(CITV,650,250,610,0.01,1,"decreciente");

% Coste de consumo en €/km.
CC=0.092;
V_CC=FVcontinua(CC,0.12,0.02,0.12,0.01,1,"decreciente");

% Depreciación tras un año de uso, en porcentaje.
PVFU=20;
V_PVFU=FVcontinua(PVFU,30,10,11,0.8,2.5,"decreciente");

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
ISE=PCriterioCI*PCI*V_CI+PCriterioUso*(PCMR*V_CMR+PCITV*V_CITV+PCC*V_CC)+PCriterioVResidual*PPVFU*V_PVFU;

% PILAR SOCIAL

% Seguridad ocupantes adultos. Se mide en porcentaje.
SOA=80;
V_SOA=FVcontinua(SOA,20,100,50,1,4.9,"creciente");

% Seguridad ocupantes niños. Se mide en porcentaje.
SON=82;
V_SON=FVcontinua(SON,20,100,50,1,4.9,"creciente");

% Usuarios vulnerables de la calzada. Se mide en porcentaje.
UVC=67;
V_UVC=FVcontinua(UVC,10,100,50,0.98,4.9,"creciente");

% Ayudas de seguridad a la conducción. Se mide en porcentaje.
ASC=66;
V_ASC=FVcontinua(ASC,10,100,50,0.98,4.9,"creciente");

% Pesos de los indicadores pertenecientes al criterio de "seguridad":
PSOA=0.2731;
PSON=0.3152;
PUVC=0.2661;
PASC=0.1456;
% Cálculo del nivel de satisfacción asociado al criterio de "seguridad":
V_Seguridad=PSOA*V_SOA+PSON*V_SON+PUVC*V_UVC+PASC*V_ASC;

% Número de plazas.
NP=5;
V_NP=FVdiscreta2(NP,[0.1 0.3 0.5 0.7 0.9 1]);

% Número de puertas para pasajeros.
NPP=2;
V_NPP=FVdiscreta2(NPP,[0 1]);

% Altura acceso asientos y plataforma.
AAA=4;
V_AAA=FVdiscreta2(AAA,[0.1 1 0.5 0.7]);

% Comodidad de amortiguación.
CA=3;
V_CA=FVdiscreta2(CA,[0.2 1 0.8]);

% Capacidad y comodidad del maletero. Defino una función específica para
% este indicador.
% Volumen del maletero en l:
Vol=422;
% A1 toma un valor de 1 si es posible abatir los asientos y un 0 en caso
% contrario:
A1=1;
% A2 toma un valor de 1 si el portón tiene un acceso más bajo, 0 en caso
% contrario.
A2=1;
% A3 toma un valor de 1 si el portón se puede abrir sin usar las manos, 0
% en caso contrario.
A3=0;
V_CCM=Maletero(Vol,A1,A2,A3);

% Nivel de conducción autónoma.
NCA=3;
V_NCA=FVdiscreta2(NCA,[0 0.35 0.75 1 1 1]);

% Acceso a zonas urbanas.
AZU=2;
V_AZU=FVdiscreta2(AZU,[1 0]);

% Par motor/peso en marcha en Nm/kg.
PM=0.200;
V_PM=FVcontinua(PM,0.1,0.2,0.105,1.8,1.8,"creciente");

% Potencia/peso en marcha CV. Se mide en CV cada 1000 kg (CV/t).
PP=0.087;
V_PP=FVcontinua(PP,0.06,0.2,0.105,1,1.8,"creciente");

% Estaciones de repostaje.
ER=1;
V_ER=FVdiscreta2(ER,[1 0.4 0]);

% Velocidad de repostaje en minutos.
VR=10;
V_VR=FVcontinua(VR,30,10,20,0.8,2.2,"decreciente");

% Autonomía medida en km.
AUT=896;
V_AUT=FVcontinua(AUT,400,700,430,0.01,1,"creciente");

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
V_Funcionalidad=PNP*V_NP+PNPP*V_NPP+PAAA*V_AAA+PCA*V_CA+PCCM*V_CCM+PNCA*V_NCA+PAZU*V_AZU+PPM*V_PM+PPP*V_PP+PER*V_ER+PVR*V_VR+PAUT*V_AUT;

% Lugar de fabricación.
FABR=2;
V_FABR=FVdiscreta2(FABR,[1 0.6 0]);
% Peso del indicador perteneciente al criterio de "empleo".
PFABR=1;

% Cálculo del nivel de satisfacción asociado al criterio de "empleo".
V_Empleo=PFABR*V_FABR;

% Diseño. El usuario introduce directamente un valor entre 0 y 1 para
% indicar su satisfacción con un diseño en concreto.
V_DIS=1;

% Peso del indicador perteneciente al criterio de "diseño".
PDIS=1;

% Cálculo del nivel de satisfacción asociado al criterio de "diseño".
V_Diseno=PDIS*V_DIS;

% Marca (asociado a estatus social).
MARCA=2;
V_MARCA=FVdiscreta2(MARCA,[0 0.5 1]);

% Tamaño (asociado a estatus social). 
TAM=4;
V_TAM=FVdiscreta2(TAM,[1 0.7 0.4 0.2 0]);

% Precio de compra (asociado a estatus social).
PCOM=32100;
V_PCOM=FVcontinua(PCOM,15000,150000,68500,1.3,1.6,"creciente");

% Peso de los indicadores pertenecientes al criterio de "estatus social".
PMARCA=0.4719;
PTAM=0.3319;
PPCOM=0.1962;

% Cálculo del nivel de satisfacción asociado al criterio de "estatus
% social".
V_Estatus=PMARCA*V_MARCA+PTAM*V_TAM+PPCOM*V_PCOM;

% Pesos criterios sociales:
PCriterioSeguridad=0.3116;
PCriterioFuncionalidad=0.2821;
PCriterioEmpleo=0.1132;
PCriterioDiseno=0.2296;
PCriterioEstatus=0.0635;
% Cálculo índice sostenibilidad social (entre 0 y 1, falta considerar peso requerimiento):
ISS=PCriterioSeguridad*V_Seguridad+PCriterioFuncionalidad*V_Funcionalidad+PCriterioEmpleo*V_Empleo+PCriterioDiseno*V_Diseno+PCriterioEstatus*V_Estatus;

% PILAR MEDIOAMBIENTAL

% Ecoindicator-99
ECO=16;
V_ECO=FVcontinua(ECO,28,8,1,0.01,1,"decreciente");   

% Pesos del indicador medioambiental:
PECO=1;
% Peso del criterio mediambiental:
PCriterioMedioambiental=1;

% Cálculo índice sostenibilidad medioambiental (entre 0 y 1, falta considerar peso requerimiento):
ISM=PCriterioMedioambiental*(PECO*V_ECO);

% Pesos de los requerimientos:
PEconomico=0.3289;
PSocial=0.3311;
PMedioambiental=0.34;

% Cálculo del índice de sostenibilidad:
IS=PEconomico*ISE+PSocial*ISS+PMedioambiental*ISM;



