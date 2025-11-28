%To classify the patterns using Hebbs learning. E and F target are given as: (*) indicates '+1' and (-) indicates '-1'. The E and F pattern are formed on 5 x 4 grid. Therefore input vector of E & F has 20 elements each. To identify the pattern let '1' indicates target if 'E' is recognized and '-1' indicates target if 'F' is recognized.

clear;
clc;
E = [ 1  1  1  1;
      1 -1 -1 -1;
      1  1  1 -1;
      1 -1 -1 -1;
      1  1  1  1 ];
F = [ 1  1  1  1;
      1 -1 -1 -1;
      1  1  1 -1;
      1 -1 -1 -1;
      1 -1 -1 -1 ];
xE = reshape(E',1,[]);
xF = reshape(F',1,[]);
tE = 1;
tF = -1;
W = xE*tE + xF*tF;
yE = sign(xE*W');
yF = sign(xF*W');
disp(['Output for E = ', num2str(yE)])
disp(['Output for F = ', num2str(yF)])
figure;
subplot(1,2,1);
imagesc(E); 
colormap(gray); 
title('Pattern E'); 
axis equal tight;
subplot(1,2,2);
imagesc(F); 
colormap(gray); 
title('Pattern F'); 
axis equal tight;