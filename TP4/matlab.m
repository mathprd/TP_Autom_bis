clc
clear all
close all

%% Définition des variables
Km = 42.8 ;
tau = 0.214 ;
Ps = 1.58 ;
Rr = 1/9 ;
k1 = 0.5 ;  %Must be between 0 and 1
H = 1 ;
Sr = 7.25 ;
X = 0.5:0.1:12;
a=H/2;

%% Définition du lieu critique + affichage
N = 4*Sr./(X.*pi).*(sqrt(1-(a^2)./(X.^2)) - 1i*a./X);
reel = real(-1./N);
imaginaire = imag(-1./N);
figure (1)
plot(reel, imaginaire, '-or');
hold on

%% Définition des lieux linéaires + affichage
for k1 = 0.3:0.1:0.7
   L = tf(k1*Km*Rr*Ps, [tau 1 0]) ;
   nyquist(L);
   hold on
end
title("Tracé des lieux dans le plan de Nyquist pour différents k1")



%% Pour tracer seulement k1=0.5
% k1=0.5 ;
% Gp = tf(Km*k1*Rr*Ps,[tau 1 0]) ;
% 
% figure(2)
% plot(reel, imaginaire, '-or');
% hold on ;
% [re, im, wout] = nyquist(Gp);
% nyquist(Gp)

%% Pour tracer le lieu critique réel du relai

% figure(3) ;
% title("Lieu critique du relais") ;
% for k1 = 0.3:0.1:0.7
%    L = tf(k*Km*Rr*Ps, [tau 1 0]) ;
%    nyquist(L);
%    hold on
% end
% 

%% Pour diminuer l'amplitude par 2

% k1 = 0.5 ;
% beta = 0.1 ;
% 
% Gp = tf(Km*k1*Rr*Ps,[tau 1 0]) ;
% 
% figure(4)
% for k2 = 0.1:0.1:1
%    Gbis = tf(k1*Km*Rr*k2*beta, [tau 1]) ;
%    G = Gp + Gbis ;
%    nyquist(G);
%    hold on
% end
% plot(reel, imaginaire, '-or');

%Pour diminuer par 2 l'amplitude dde l'auto-oscilation à k1=0.5 (X0 =
%1.27), il faut choisir k2 = 0.7

%% SIMULATION
simu = sim('fichier_simulink.slx') ;


% On trouve pour k1 = 0.3 : w = 9 rad/s et X0 = 1.08
% On trouve pour k1 = 0.4 : w = 10 rad/s et X0 = 1.18
% On trouve pour k1 = 0.5 : w = 10.9 rad/s et X0 = 1.27
% On trouve pour k1 = 0.6 : w = 11.7 rad/s et X0 = 1.34
% On trouve pour k1 = 0.7 : w = 12.3 rad/s et X0 = 1.41
