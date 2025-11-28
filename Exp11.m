%To solving travelling salesman problem using genetic algorithm

%===========================================================
% Travelling Salesman Problem using Genetic Algorithm (GA)
% Permutation representation, OX crossover, swap mutation
%===========================================================
clc; clear; close all;

%% ---- Distance matrix (example with 5 cities) ----
%  You can change this matrix for your own problem
D = [ 0   2   9  10   7;
      1   0   6   4   3;
      15  7   0   8   3;
      6   3  12   0   11;
      9   5   2   7   0 ];

numCities = size(D,1);

%% ---- GA parameters ----
popSize = 50;      % population size
maxGen  = 300;     % number of generations
pc      = 0.9;     % crossover probability
pm      = 0.1;     % mutation probability (per individual, swap mutation)

%% ---- Initialize population (each row is a tour) ----
pop = zeros(popSize, numCities);
for i = 1:popSize
    pop(i,:) = randperm(numCities);
end

bestCostHistory = zeros(maxGen,1);

%% ---- Main GA loop ----
for gen = 1:maxGen
    
    % ----- Evaluate population -----
    tourCost  = zeros(popSize,1);
    fitness   = zeros(popSize,1);
    
    for i = 1:popSize
        tourCost(i) = tour_length(pop(i,:), D);
        fitness(i)  = 1 / (tourCost(i) + eps);   % larger fitness = better
    end
    
    % Keep track of best individual (elitism)
    [bestCost, bestIdx] = min(tourCost);
    bestTour             = pop(bestIdx,:);
    bestCostHistory(gen) = bestCost;
    
    % ----- Selection (roulette wheel) -----
    fitnessNorm = fitness / sum(fitness);
    cumFit      = cumsum(fitnessNorm);
    
    newPop = zeros(size(pop));
    % elitism: copy best directly
    newPop(1,:) = bestTour;
    
    % create rest of new population
    for i = 2:2:popSize
        % Select parents
        p1 = pop(roulette_select(cumFit), :);
        p2 = pop(roulette_select(cumFit), :);
        
        % Crossover
        r = rand;
        if r < pc
            [c1, c2] = ox_crossover(p1, p2);
        else
            c1 = p1;
            c2 = p2;
        end
        
        % Mutation (swap two cities)
        if rand < pm
            c1 = swap_mutation(c1);
        end
        if rand < pm
            c2 = swap_mutation(c2);
        end
        
        newPop(i,:) = c1;
        if i+1 <= popSize
            newPop(i+1,:) = c2;
        end
    end
    
    pop = newPop;
    
    % Show progress occasionally
    if mod(gen,50)==0 || gen==1 || gen==maxGen
        fprintf('Generation %3d  Best tour length: %.4f\n', gen, bestCost);
    end
end

%% ---- Final result ----
[finalCost, finalIdx] = min(bestCostHistory);
fprintf('\nBest tour found:\n');
disp(bestTour);
fprintf('Tour length: %.4f\n', finalCost);

% Optional: plot convergence
figure;
plot(bestCostHistory,'LineWidth',2);
xlabel('Generation'); ylabel('Best tour length');
title('GA for TSP'); grid on;

%===========================================================
%              HELPER FUNCTIONS
%===========================================================

% ---- Compute length of a tour ----
function L = tour_length(tour, D)
    n = numel(tour);
    L = 0;
    for i = 1:n-1
        L = L + D(tour(i), tour(i+1));
    end
    % return to starting city
    L = L + D(tour(n), tour(1));
end

% ---- Roulette wheel selection ----
function idx = roulette_select(cumFit)
    r = rand;
    idx = find(cumFit >= r, 1, 'first');
end

% ---- Order Crossover (OX) ----
function [child1, child2] = ox_crossover(p1, p2)
    n = numel(p1);
    child1 = zeros(1,n);
    child2 = zeros(1,n);
    
    % choose two cut points
    pts = sort(randperm(n,2));
    c1 = pts(1); c2 = pts(2);
    
    % Copy slice from parents
    child1(c1:c2) = p1(c1:c2);
    child2(c1:c2) = p2(c1:c2);
    
    % Fill remaining positions from the other parent (in order)
    pos = mod(c2, n) + 1;
    for i = 1:n
        idx = mod(c2 + i - 1, n) + 1;
        if ~ismember(p2(idx), child1)
            child1(pos) = p2(idx);
            pos = mod(pos, n) + 1;
        end
    end
    
    pos = mod(c2, n) + 1;
    for i = 1:n
        idx = mod(c2 + i - 1, n) + 1;
        if ~ismember(p1(idx), child2)
            child2(pos) = p1(idx);
            pos = mod(pos, n) + 1;
        end
    end
end

% ---- Swap mutation (swap two random positions) ----
function mutant = swap_mutation(tour)
    n = numel(tour);
    pts = randperm(n,2);
    mutant      = tour;
    mutant(pts) = mutant(fliplr(pts));
end