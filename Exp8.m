%To implement XOR function using Madaline network. Use random initial weight and bias.

% MADALINE implementation for 2-input XOR function (bipolar)
% Inputs:  x1, x2 ∈ {-1, 1}
% Targets: t ∈ {-1, 1}
% Network: 2 inputs -> H hidden neurons -> 1 output neuron

clear; clc; close all;

%% Training Data (Bipolar XOR)
% Patterns as columns: [x1; x2]
X = [ -1  -1   1   1 ;   % x1
      -1   1  -1   1 ];  % x2

% XOR targets (bipolar): 0→-1, 1→+1
% 0 xor 0 = 0 → -1
% 0 xor 1 = 1 → +1
% 1 xor 0 = 1 → +1
% 1 xor 1 = 0 → -1
T = [-1  1  1  -1];

nInput  = 2;
nHidden = 2;   % you can also try 3
nOutput = 1;

%% Hyperparameters
eta    = 0.1;   % learning rate
epochs = 500;   % maximum number of epochs

%% Random Initialization of Weights & Biases
rng('shuffle');  % different random values each run

W1 = randn(nHidden, nInput);   % hidden layer weights
b1 = randn(nHidden, 1);        % hidden layer biases

W2 = randn(nOutput, nHidden);  % output layer weights
b2 = randn(nOutput, 1);        % output layer bias

%% Activation function (bipolar sign)
bipolar_sign = @(x) 2 * (x >= 0) - 1;   % returns -1 or +1

%% Training
for epoch = 1:epochs
    nErrors = 0;
    
    for i = 1:size(X, 2)
        x = X(:, i);   % current input (2x1)
        t = T(i);      % target scalar
        
        % ---- Forward Pass ----
        % Hidden layer
        net1 = W1 * x + b1;          % (nHidden x 1)
        a1   = bipolar_sign(net1);   % hidden outputs
        
        % Output layer
        net2 = W2 * a1 + b2;         % scalar
        a2   = bipolar_sign(net2);   % final output
        
        % ---- Error ----
        e = t - a2;
        if e ~= 0
            nErrors = nErrors + 1;
        end
        
        % ---- Weight Update (simple Madaline-style / backprop-like) ----
        % Update output layer weights and bias
        W2 = W2 + eta * e * a1';
        b2 = b2 + eta * e;
        
        % Update hidden layer weights and biases
        % (propagate error back using output weights sign)
        % This is a simple heuristic update for Madaline
        for j = 1:nHidden
            e_hidden = e * W2(1, j);        % contribution of hidden neuron j
            W1(j, :) = W1(j, :) + eta * e_hidden * x'; 
            b1(j)    = b1(j)    + eta * e_hidden;
        end
    end
    
    % If all patterns classified correctly, stop early
    if nErrors == 0
        fprintf('Training converged at epoch %d\n', epoch);
        break;
    end
end

%% Display final weights and biases
fprintf('\nFinal Hidden Layer Weights (W1):\n');
disp(W1);
fprintf('Final Hidden Layer Biases (b1):\n');
disp(b1);

fprintf('Final Output Layer Weights (W2):\n');
disp(W2);
fprintf('Final Output Layer Bias (b2):\n');
disp(b2);

%% Testing the network on all XOR patterns
fprintf('\nTesting MADALINE on XOR function (bipolar):\n');
for i = 1:size(X, 2)
    x = X(:, i);
    
    % Forward pass
    net1 = W1 * x + b1;
    a1   = bipolar_sign(net1);
    net2 = W2 * a1 + b2;
    a2   = bipolar_sign(net2);
    
    fprintf('Input: [%2d %2d]  Target: %2d  Output: %2d\n', ...
            x(1), x(2), T(i), a2);
end