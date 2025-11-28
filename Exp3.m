%To implement 2 input NOR, NAND, and AND-NOT function using McCulloch-pitts network

% Exp3: Implement 2-input NOR, NAND, and AND-NOT using McCulloch-Pitts neuron
clc; clear;

% Define all possible binary inputs (x1, x2)
inputs = [0 0;
          0 1;
          1 0;
          1 1];

% McCulloch-Pitts step function
step_mcp = @(net, theta) double(net >= theta);

%% ---- NOR Function (NOT OR) ----
% NOR = 1 only when both inputs are 0
% Use w1 = -1, w2 = -1, theta = -0.5
w_nor = [-1 -1];
theta_nor = -0.5;

disp('2-input NOR using McCulloch-Pitts Neuron');
disp(' x1  x2   net    y');
for i = 1:size(inputs,1)
    x = inputs(i,:);
    net = w_nor * x';
    y = step_mcp(net, theta_nor);
    fprintf('  %d   %d   %4.1f   %d\n', x(1), x(2), net, y);
end

%% ---- NAND Function (NOT AND) ----
% NAND = 0 only when both inputs are 1
% Use w1 = -1, w2 = -1, theta = -1.5
w_nand = [-1 -1];
theta_nand = -1.5;

disp(' ');
disp('2-input NAND using McCulloch-Pitts Neuron');
disp(' x1  x2   net    y');
for i = 1:size(inputs,1)
    x = inputs(i,:);
    net = w_nand * x';
    y = step_mcp(net, theta_nand);
    fprintf('  %d   %d   %4.1f   %d\n', x(1), x(2), net, y);
end

%% ---- AND-NOT Function (X AND NOT Y) ----
% Here we implement: y = x1 AND (NOT x2)
% Truth table:
% x1 x2 | y
% 0  0  | 0
% 0  1  | 0
% 1  0  | 1
% 1  1  | 0
%
% Use w1 = 1, w2 = -1, theta = 0.5
w_andnot = [1 -1];
theta_andnot = 0.5;

disp(' ');
disp('2-input AND-NOT using McCulloch-Pitts Neuron (y = x1 AND NOT x2)');
disp(' x1  x2   net    y');
for i = 1:size(inputs,1)
    x = inputs(i,:);
    net = w_andnot * x';
    y = step_mcp(net, theta_andnot);
    fprintf('  %d   %d   %4.1f   %d\n', x(1), x(2), net, y);
end