%Consider the following two fuzzy sets A and B defined over a universe of discourse [0-5] with following membership functions:
%Determine the membership functions of the following:

clc; 
clear; 
close all; 
x = 0:0.1:5; 
mu_A  = x./(1+x); 
mu_B  = 2.^(-x); 
 
% a) Complements A̅ and B̅ 
mu_Ac = 1 - mu_A; 
mu_Bc = 1 - mu_B; 
 
% b) Union A ∪ B 
mu_AUB = max(mu_A, mu_B); 
 
% c) Intersection A ∩ B 
mu_AnB = min(mu_A, mu_B); 
 
% d) (A ∪ B)^c 
mu_AUB_c = 1 - mu_AUB; 
 
figure; 
subplot(3,2,1) 
plot(x, mu_A,'LineWidth',2); hold on; plot(x, mu_B,'LineWidth',2); 
title('Original Sets A and B'); legend('A','B'); grid on; 
subplot(3,2,2) 
plot(x, mu_Ac,'r','LineWidth',2); hold on; plot(x, mu_Bc,'b','LineWidth',2); 
title('Complements A^c & B^c'); legend('A^c','B^c'); grid on; 
subplot(3,2,3) 
plot(x, mu_AUB,'m','LineWidth',2); 
title('Union A ∪ B'); grid on; 
subplot(3,2,4) 
plot(x, mu_AnB,'k','LineWidth',2); 
title('Intersection A ∩ B'); grid on; 
subplot(3,2,5) 
plot(x, mu_AUB_c,'g','LineWidth',2); 
title('(A ∪ B)^c'); grid on; 