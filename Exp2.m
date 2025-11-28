%To implement 2 input OR and AND function using McCulloch-pitts network

% Exp2: Implement 2-input OR and AND using McCulloch-Pitts neuron
clc; clear;

% Define all possible binary inputs (x1, x2)
inputs = [0 0;
          0 1;
          1 0;
          1 1];

% McCulloch-Pitts step function
step_mcp = @(net, theta) double(net >= theta);

%% ---- OR Function ----
% Choose weights and threshold for OR:
% OR truth table: output = 1 if at least one input is 1
% Use w1 = 1, w2 = 1, theta = 0.5
w_or = [1 1];
theta_or = 0.5;

disp('2-input OR using McCulloch-Pitts Neuron');
disp(' x1  x2  net  y');
for i = 1:size(inputs,1)
    x = inputs(i,:);
    net = w_or * x';          % weighted sum
    y = step_mcp(net, theta_or);
    fprintf('  %d   %d   %.1f   %d\n', x(1), x(2), net, y);
end

%% ---- AND Function ----
% AND truth table: output = 1 only when both inputs are 1
% Use w1 = 1, w2 = 1, theta = 1.5
w_and = [1 1];
theta_and = 1.5;

disp(' ');
disp('2-input AND using McCulloch-Pitts Neuron');
disp(' x1  x2  net  y');
for i = 1:size(inputs,1)
    x = inputs(i,:);
    net = w_and * x';
    y = step_mcp(net, theta_and);
    fprintf('  %d   %d   %.1f   %d\n', x(1), x(2), net, y);
end