%To generate various activation functions that are being used in neural networks

% Exp1: Generate various activation functions used in neural networks
clc; clear; close all;

% Input range
x = -10:0.1:10;

% 1) Binary Step (Hard Limit)
f_step = double(x >= 0);

% 2) Bipolar Step
f_bipolar = ones(size(x));
f_bipolar(x < 0) = -1;

% 3) Linear Activation
f_linear = x;

% 4) Sigmoid (Logistic)
f_sigmoid = 1 ./ (1 + exp(-x));

% 5) Hyperbolic Tangent (tanh)
f_tanh = tanh(x);

% 6) ReLU (Rectified Linear Unit)
f_relu = max(0, x);

% ---- Display sample values in Command Window ----
disp('Sample values at x = -2, 0, 2:');
idx = [find(x==-2,1), find(x==0,1), find(x==2,1)];
disp(table(x(idx)', f_step(idx)', f_bipolar(idx)', f_linear(idx)', ...
    f_sigmoid(idx)', f_tanh(idx)', f_relu(idx)', ...
    'VariableNames', {'x','Step','Bipolar','Linear','Sigmoid','Tanh','ReLU'}));

figure;
subplot(3,2,1); plot(x, f_step,'LineWidth',1.5);   title('Binary Step'); grid on;
subplot(3,2,2); plot(x, f_bipolar,'LineWidth',1.5);title('Bipolar Step'); grid on;
subplot(3,2,3); plot(x, f_linear,'LineWidth',1.5); title('Linear'); grid on;
subplot(3,2,4); plot(x, f_sigmoid,'LineWidth',1.5);title('Sigmoid'); grid on;
subplot(3,2,5); plot(x, f_tanh,'LineWidth',1.5);   title('Tanh'); grid on;
subplot(3,2,6); plot(x, f_relu,'LineWidth',1.5);   title('ReLU'); grid on;