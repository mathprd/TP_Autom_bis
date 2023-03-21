clear all;
close all;
clc;



K_m = 42.8;
tau = 0.214;
P_s = 1.58;
R_tau = 1/9;
k1 = 0.5;
Beta = 0.1;
M = 7.25;
H = 1;


G_p = tf(k1*K_m*R_tau*P_s, [tau 1 0])

[re, im, wout] = nyquist(G_p);
nyquist(G_p)
hold on;

X = 1:0.1:20;
a=H/2;

N = 4*M./(X.*pi).*(sqrt(1-a^2./(X.^2)) - 1i*a./X);
reel = real(-1./N);
imaginaire = imag(-1./N);
plot(reel, imaginaire, '-or');


figure (2)

for k = 0.3:0.1:0.7
   G_p = tf(k*K_m*R_tau*P_s, [tau 1 0]) 
   nyquist(G_p);
   
   hold on
end

k2 = 0.3;

FTBF = feedback(tf(k1*K_m*R_tau, [tau 1]), Beta*k2)
T_p = FTBF*tf(P_s, [1 0])

figure(3)
nyquist(T_p)
X = 0.643;
N_ = 4*M/(X*pi)*(sqrt(1-a^2/(X^2)) - 1i*a/X)
hold on;
plot(real(-1/N_), imag(-1/N_),'x')

