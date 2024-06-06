clear all
clc


%PARAMETROS DE CONFIGURACIÓN - PSO.
N=150;
D=4;
Max_ite=5000;
%W=0.729; %1
C1=2; %2.8
C2=2; %1.3
LB=[0.0625; 0.0625; 10; 10];
UB=[6.1875 6.1875 200 200];

%DECLARACIÓN DE VARIABLES
X=zeros(N,D);
J=zeros(N,1);
V=zeros(N,D);
pBest_graf=zeros(N,D,Max_ite);
JBest_graf=zeros(Max_ite,1);
gBest_graf=zeros(Max_ite,D);




%GENERACIÓN DEL ENJABMRE INICIAL.
for j=1:D
    X(:,j)= LB(j) + rand(N,1)*(UB(j)-LB(j));
end

%GENERACIÓN DE VELOCIDADES INICIALES.
for j=1:D
   V(:,j)= LB(j) + rand(N,1)*(UB(j)-LB(j));
end

%V

%EVALUACIÓN DEL ENJAMBRE DE PARTÍCULAS INICIAL
for p=1:N
   J(p,1)=FunObj(X(p,:));
end

pBest=X;
[JBest,ibest]=min(J);
gBest=pBest(ibest,:);



%BUCLE PRINCIPAL
for ite=1:Max_ite
    W = 0.9 + ((0.9 - 0.4)*(Max_ite - ite)/Max_ite);
    for i=1:N

        %VECTORES ALEATORIOS
        r1=rand(1,D);
        r2=rand(1,D);

        %ACTUALIZACIÓN DE VELOCIDAD
        %pBest(i,:)
        V(i,:)=W*V(i,:)+C1*r1.*(pBest(i,:)-X(i,:))+C2*r2.*(gBest-X(i,:));
        
        %ACTUALIZACIÓN DE POSICIÓN
        X(i,:)=X(i,:)+V(i,:);
        for j=1:D
            if X(i,j)<LB(j)
                X(i,j)=LB(j);
            elseif X(i,j)>UB(j)
                X(i,j)=UB(j);
            end
        end

        %ACTUALIZACIÓN DE pBest Y gBest
        J_temp=FunObj(X(i,:));
        if J_temp<J(i,1)
            J(i,1)=J_temp;
            pBest(i,:)=X(i,:);
            if J_temp<JBest
                JBest=J_temp;
                gBest=X(i,:);
            end
        end
    

    end

    %VARIABLES PARA ANÁLISIS
    pBest_graf(:,:,ite)=pBest;
    JBest_graf(ite,1)=JBest;
    gBest_graf(ite,:)=gBest;

    %IMPRESIÓN DE RESULTADOS
    disp('----------------------------------')
    disp(['ite: ' num2str(ite)])
    disp(['JBest: ' num2str(JBest)])
    disp(['[X1 X2]: ' num2str(gBest)])
    
end

%save resultados pBest_graf JBest_graf gBest_graf Max_ite

% GENERACIÓN DEL HISTOGRAMA
save resultado3 pBest_graf JBest_graf gBest_graf Max_ite
figure;
histogram(JBest_graf);
title({'Histograma - Linearly Decreasing'})
xlabel('Mejor Valor de la Función Objetivo');
ylabel('Frecuencia');
grid on;