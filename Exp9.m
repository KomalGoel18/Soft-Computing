%Write a program to store vector [-1 -1 -1 -1] and [-1 -1 1 1] in an auto-associative net. Find weight matrix. Test the net with [1 1 1 1] as input.

% Auto-associative (Hopfield) network for 4-neuron patterns
% Store patterns [-1 -1 -1 -1] and [-1 -1  1  1]
% Test with input [1 1 1 1]

clear; clc;

%% Store the patterns (each row is a pattern)
P = [ -1 -1 -1 -1;   % pattern 1
      -1 -1  1  1 ]; % pattern 2

[nPatterns, nNeurons] = size(P);

%% Hebbian learning for auto-associative memory
W = zeros(nNeurons, nNeurons);

for k = 1:nPatterns
    v = P(k, :)';            % column vector (4x1)
    W = W + v * v';          % outer product
end

% Remove self-connections (zero diagonal)
W = W - diag(diag(W));

%% Display the weight matrix
disp('Weight matrix W:');
disp(W);

%% Test the net with input [1 1 1 1]
x = [1; 1; 1; 1];            % test input as column vector

% One synchronous update
net = W * x;                 
y = sign(net);               % bipolar output

% (Optional) handle zeros: treat sign(0) as +1
y(y == 0) = 1;

disp('Input  : [1  1  1  1]');
disp('Output :');
disp(y');