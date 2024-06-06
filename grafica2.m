

clear all
clc
load resultado1.mat;
JBest_graf1 = JBest_graf;
load resultado2.mat
JBest_graf2 = JBest_graf;
load resultado3.mat;
JBest_graf3 = JBest_graf;

% Graficar la convergencia de los tres resultados
figure;
plot(JBest_graf1, 'r', 'LineWidth', 1.5); % Convergencia de la configuración 1
hold on;
plot(JBest_graf2, 'g', 'LineWidth', 1.5); % Convergencia de la configuración 2
plot(JBest_graf3, 'b', 'LineWidth', 1.5); % Convergencia de la configuración 3
hold off;

% Configuración de la gráfica
title('Convergencia de Diferentes Configuraciones PSO');
xlabel('Iteraciones');
ylabel('Mejor Valor de la Función Objetivo');
legend('Constriction', 'Random Inertia Weight', 'Linearly Decreasing Inertia Weight');
grid on;