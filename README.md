## Soft Computing – MATLAB Experiments

This repository contains a set of small MATLAB programs illustrating core concepts from **soft computing**, including neural networks, Hebbian learning, ADALINE/MADALINE, Hopfield networks, fuzzy sets and logic, and genetic algorithms.

Each experiment is a standalone `.m` script named `ExpN.m` (for \(N = 1 to 12\)). You can open and run any script independently in MATLAB.

---

## Requirements

- **MATLAB** (R2018a or later recommended)
- For some experiments you also need the following toolboxes:
  - **Neural Network Toolbox** / **Deep Learning Toolbox**
  - **Fuzzy Logic Toolbox**
  - **Global Optimization Toolbox** (for the `ga` function)

If a toolbox is missing, MATLAB will warn you when running the corresponding experiment.

---

## How to Run the Experiments

1. **Clone or download** this repository to your machine.
2. Open **MATLAB** and set the **Current Folder** to the `Soft-Computing` directory.
3. Run any experiment in one of the following ways:
   - From the **Editor**: open, for example, `Exp1.m` and click **Run**.
   - From the **Command Window**:
     - Type `Exp1` and press Enter to run experiment 1.

Most scripts print results to the Command Window and/or open figures to visualize activation functions, decision boundaries, patterns, or algorithm convergence.

---

## Experiment Overview

### `Exp1.m` – Neural Network Activation Functions

Generates and plots common activation functions used in neural networks over a range of inputs:

- Binary step (hard limit)
- Bipolar step
- Linear
- Sigmoid (logistic)
- Hyperbolic tangent (\(\tanh\))
- ReLU (rectified linear unit)

The script also prints sample values at selected input points.

---

### `Exp2.m` – McCulloch–Pitts Neuron: OR and AND

Implements a 2‑input **McCulloch–Pitts neuron** to realize:

- Logical **OR**
- Logical **AND**

Uses suitable weights and thresholds and prints the net input and output for all combinations of binary inputs \((x_1, x_2)\).

---

### `Exp3.m` – McCulloch–Pitts Neuron: NOR, NAND, AND‑NOT

Extends the McCulloch–Pitts model to implement:

- **NOR** (NOT‑OR)
- **NAND** (NOT‑AND)
- **AND‑NOT** (e.g., \(y = x_1 \land \lnot x_2\))

The script prints the truth tables, showing how different weight/threshold choices realize various logical functions.

---

### `Exp4.m` – Hebbian Learning: AND‑NOT and OR

Demonstrates **Hebb’s learning rule** on binary inputs to learn:

- **AND‑NOT** function
- **OR** function

The program:

- Defines input patterns and target outputs.
- Updates weights using Hebbian learning.
- Computes and displays predicted outputs using the learned weights.

---

### `Exp5.m` – Hebbian Pattern Classification (E vs F)

Implements Hebbian learning for **pattern classification** on a \(5 \times 4\) grid:

- Patterns resemble the characters **E** and **F** using \(\pm 1\) values.
- Each pattern is flattened into a 20‑dimensional input vector.
- Targets are \(+1\) for **E** and \(-1\) for **F**.

The script:

- Learns a single weight vector using Hebb’s rule.
- Tests classification on both patterns (E and F).
- Visualizes the patterns using `imagesc`.

---

### `Exp6.m` – Perceptron: AND and OR

Uses MATLAB’s **perceptron** object to learn:

- 2‑input **AND**
- 2‑input **OR**

Key features:

- Trains separate perceptrons for AND and OR.
- Plots the input patterns with different markers for the two classes.
- Draws the learned **decision boundary** for each perceptron.

Requires the Neural Network Toolbox / Deep Learning Toolbox.

---

### `Exp7.m` – ADALINE: Bipolar OR

Implements an **ADALINE (Adaptive Linear Neuron)** network for the 2‑input OR function with **bipolar coding**:

- Inputs and targets are in \(\{-1, +1\}\).
- Uses gradient‑descent / LMS updates on weights and bias.
- Tracks mean‑squared error (MSE) over epochs.

The script:

- Trains until a maximum number of epochs or until MSE falls below a tolerance.
- Prints final weights and bias.
- Tests all input patterns and prints targets vs. predicted outputs.
- Optionally plots the MSE curve over epochs.

---

### `Exp8.m` – MADALINE: Bipolar XOR

Implements a simple **MADALINE** network to learn the **XOR** function with bipolar inputs:

- 2 inputs, a small hidden layer, and 1 output neuron.
- Bipolar activation (\(\pm 1\)).

The program:

- Initializes weights and biases randomly.
- Performs forward passes through hidden and output layers.
- Updates weights and biases using a Madaline‑style / backprop‑like heuristic.
- Stops early if all training patterns are classified correctly.
- Prints final parameters and tests all XOR patterns.

---

### `Exp9.m` – Hopfield Auto‑Associative Memory

Implements a 4‑neuron **auto‑associative (Hopfield) network**:

- Stores two bipolar patterns:
  - \([-1 -1 -1 -1]\)
  - \([-1 -1  1  1]\)
- Uses Hebbian outer‑product learning to form the weight matrix \(W\) with zero diagonal.

The script:

- Displays the learned weight matrix.
- Tests the network with input \([1 1 1 1]\).
- Shows the output pattern after one synchronous update using `sign(W * x)`.

---

### `Exp10.m` – Fuzzy Sets: Union, Intersection, Complement

Works with two fuzzy sets \(A\) and \(B\) over the universe \([0, 5]\) defined by:

- \(\mu_A(x) = \dfrac{x}{1 + x}\)
- \(\mu_B(x) = 2^{-x}\)

The script computes and plots:

- Complements \(A^c\) and \(B^c\)
- Union \(A \cup B\) (max operator)
- Intersection \(A \cap B\) (min operator)
- Complement of the union \((A \cup B)^c\)

Several subplots visualize the original and derived membership functions.

---

### `Exp11.m` – Travelling Salesman Problem (TSP) via Genetic Algorithm

Solves a small **Travelling Salesman Problem** instance using a custom **Genetic Algorithm**:

- Distance matrix for 5 cities.
- Permutation‑based representation of tours.
- Order crossover (OX) and swap mutation.
- Roulette‑wheel selection with elitism.

The script:

- Evolves a population of tours for a fixed number of generations.
- Tracks and plots the best tour length per generation.
- Prints the best tour found and its total distance.

Note: This implementation uses plain MATLAB code and does **not** require the GA toolbox.

---

### `Exp12.m` – MATLAB Toolbox Demos (NN, Fuzzy, GA)

Provides short demos of three MATLAB toolboxes:

1. **Neural Network Toolbox / Deep Learning Toolbox**
   - Builds and trains a small feedforward network (`patternnet`) to solve XOR.
   - Displays continuous outputs and rounded class predictions.

2. **Fuzzy Logic Toolbox**
   - Creates a simple Mamdani‑type FIS for a **tip calculator**.
   - Uses linguistic terms (poor, good, excellent) and computes a suggested tip for a sample service input.

3. **Genetic Algorithm (GA) via Global Optimization Toolbox**
   - Minimizes \(f(x) = x^2 + 4\sin(5x)\) on the interval \([-5, 5]\) using `ga`.
   - Prints the best \(x\) and the corresponding function value.

---

## Notes and Tips

- **Reproducibility**: Some experiments set the random seed (e.g., `rng(0)`), while others rely on `rng('shuffle')` for variability between runs.
- **Figures**: Many scripts open figures. If you run multiple experiments in sequence, close figures or use `close all` as needed.
- **Learning Resources**: These scripts are useful as reference implementations when studying topics like perceptrons, ADALINE/MADALINE, Hopfield networks, fuzzy set operations, and genetic algorithms in soft computing.

