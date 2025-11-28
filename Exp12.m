%Introduction of MATLAB Toolboxes: Neural Network Toolbox, Fuzzy Logic Toolbox, and Genetic Algorithm toolbox

clc;
clear;
close all;

%% ==================== 1) Neural Network - XOR ==========================
disp('==============================');
disp('1) Neural Network Toolbox Demo');
disp('   Problem: XOR using feedforward NN');
disp('==============================');
rng(0); % for reproducible results
X = [0 0 1 1;
     0 1 0 1];
T = [0 1 1 0];
net = patternnet(3);
net.divideFcn = 'dividetrain';    % Train on all 4 samples
net.trainParam.epochs = 1000;
net.trainParam.goal   = 1e-4;
net = train(net, X, T);
Y = net(X);
Y_class = round(Y);
disp('XOR Inputs:');
disp(X);
disp('XOR Targets:');
disp(T);
disp('Neural Network outputs (continuous):');
disp(Y);
disp('Neural Network outputs (rounded):');
disp(Y_class);

%% ==================== 2) Fuzzy Logic - Tip Calculator ==================
disp(' ');
disp('==============================');
disp('2) Fuzzy Logic Toolbox Demo');
disp('   Problem: Tip Calculator (Mamdani FIS)');
disp('==============================');
fis = mamfis( ...
    'Name',"TipCalc", ...
    'AndMethod',"min", ...
    'OrMethod',"max", ...
    'ImplicationMethod',"min", ...
    'AggregationMethod',"max", ...
    'DefuzzificationMethod',"centroid");
fis = addInput(fis,[0 10],"Name","service");
fis = addMF(fis,"service","trimf",[0 0 5],"Name","poor");
fis = addMF(fis,"service","trimf",[0 5 10],"Name","good");
fis = addMF(fis,"service","trimf",[5 10 10],"Name","excellent");
fis = addOutput(fis,[0 30],"Name","tip");
fis = addMF(fis,"tip","trimf",[0 0 15],"Name","low");
fis = addMF(fis,"tip","trimf",[0 15 30],"Name","medium");
fis = addMF(fis,"tip","trimf",[15 30 30],"Name","high");
ruleList = [ ...
    1  1  1  1;   % service MF #1 -> tip MF #1
    2  2  1  1;   % service MF #2 -> tip MF #2
    3  3  1  1];  % service MF #3 -> tip MF #3
fis = addRule(fis, ruleList);
service_input = 7.5;
tip_out = evalfis(fis, service_input);   % new order: evalfis(fis, x)
disp(['Service Quality = ', num2str(service_input)]);
disp(['Suggested Tip % = ', num2str(tip_out)]);

%% ==================== 3) Genetic Algorithm Optimization ================
disp(' ');
disp('==============================');
disp('3) Genetic Algorithm Toolbox Demo');
disp('   Minimize f(x) = x^2 + 4 sin(5x)');
disp('==============================');
obj = @(x) x.^2 + 4*sin(5*x);
[x_best, f_best] = ga(obj, 1, [], [], [], [], -5, 5, [], ...
    optimoptions('ga', ...
    'PopulationSize', 40, ...
    'MaxGenerations', 60, ...
    'Display', 'off'));
disp(['Best x found by GA      = ', num2str(x_best)]);
disp(['Minimum function value  = ', num2str(f_best)]);
disp('===============================================================');
disp('              ALL THREE TOOLBOX PROGRAMS EXECUTED');
disp('===============================================================');