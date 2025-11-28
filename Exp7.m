%Write a MATLAB program to implement OR function with bipolar inputs and targets using Adaline network.

% ADALINE implementation for 2-input OR function with bipolar coding
% Inputs:  x1, x2 ∈ {-1, 1}
% Targets: t ∈ {-1, 1}

clear; clc; close all;

%% Training Data (Bipolar OR)
% Patterns as columns: [x1; x2]
X = [ -1  -1   1   1 ;   % x1
      -1   1  -1   1 ];  % x2

% OR targets (bipolar): -1 = FALSE, +1 = TRUE
T = [-1  1  1  1];

%% Hyperparameters
eta    = 0.1;      % Learning rate
epochs = 100;      % Maximum number of epochs
tol    = 1e-3;     % MSE tolerance for stopping

%% Weight & Bias Initialization
% weights: row vector [w1 w2]
w = randn(1, 2);
b = randn;

mse_history = zeros(1, epochs);

%% Training Loop
for epoch = 1:epochs
    sq_error_sum = 0;
    
    for i = 1:size(X, 2)
        x = X(:, i);       % current input (2x1)
        t = T(i);          % target
        
        % Adaline output (linear)
        net = w * x + b;   % scalar
        y   = net;         % linear activation
        
        % Error
        e = t - y;
        
        % Weight and bias update (LMS rule)
        w = w + eta * e * x';
        b = b + eta * e;
        
        % Accumulate squared error
        sq_error_sum = sq_error_sum + e^2;
    end
    
    % Mean Squared Error for this epoch
    mse = sq_error_sum / length(T);
    mse_history(epoch) = mse;
    
    % Stopping condition
    if mse < tol
        fprintf('Training stopped at epoch %d (MSE = %.6f)\n', epoch, mse);
        mse_history = mse_history(1:epoch);
        break;
    end
end

%% Display final weights and bias
fprintf('Final weights: [%f %f]\n', w(1), w(2));
fprintf('Final bias   : %f\n', b);

%% Test the network on all patterns
fprintf('\nTesting ADALINE on OR function (bipolar):\n');
for i = 1:size(X, 2)
    x = X(:, i);
    net = w * x + b;
    
    % Bipolar decision: sign(net)
    if net >= 0
        out = 1;
    else
        out = -1;
    end
    
    fprintf('Input: [%2d %2d]  Target: %2d  Output: %2d\n', ...
            x(1), x(2), T(i), out);
end

%% (Optional) Plot MSE over epochs
figure;
plot(mse_history, 'LineWidth', 2);
xlabel('Epoch');
ylabel('Mean Squared Error');
title('Adaline Training for Bipolar OR Function');
grid on;