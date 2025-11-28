%To implement AND-NOT and OR function using Hebb rule

clear;
clc;
X = [ 0 0 1;
      0 1 1;
      1 0 1;
      1 1 1];
T_andnot = [-1; -1;  1; -1];
T_or     = [-1;  1;  1;  1]; 
W_andnot = zeros(1,3);
W_or     = zeros(1,3);
for i=1:size(X,1)
    W_andnot = W_andnot + T_andnot(i)*X(i,:);
    W_or     = W_or + T_or(i)*X(i,:);
end
Y_andnot = sign(X*W_andnot');
Y_or     = sign(X*W_or');
disp('Hebb Rule Implementation Results:');
disp('---------------------------------');
disp('AND-NOT Function:');
disp(table(X(:,1), X(:,2), T_andnot, Y_andnot, ...
     'VariableNames', {'x1','x2','Target','Predicted'}));
disp(' ');
disp('OR Function:');
disp(table(X(:,1), X(:,2), T_or, Y_or, ...
     'VariableNames', {'x1','x2','Target','Predicted'}));