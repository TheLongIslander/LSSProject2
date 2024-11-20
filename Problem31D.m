% Read the original image
img = imread('WeeksHallSmall.jpg');

% Define the 2D gradient filters
Drow = [0 0 0; 0 1 -1; 0 0 0];
Dcol = [0 0 0; 0 1 0; 0 -1 0];
Dur = [0 0 -1; 0 1 0; 0 0 0]; % Diagonal upper-right filter
Dul = [-1 0 0; 0 1 0; 0 0 0]; % Diagonal upper-left filter

% Apply the 2D convolution using the filters
row_gradient = conv2(double(rgb2gray(img)), Drow, 'same');
col_gradient = conv2(double(rgb2gray(img)), Dcol, 'same');
dur_gradient = conv2(double(rgb2gray(img)), Dur, 'same');
dul_gradient = conv2(double(rgb2gray(img)), Dul, 'same');

% Define thresholds for diagonal filters (experimentally chosen)
tau_dur = 30; % Threshold for Dur
tau_dul = 30; % Threshold for Dul

% Threshold the results
dur_edges = abs(dur_gradient) > tau_dur;
dul_edges = abs(dul_gradient) > tau_dul;

% Display the filtered results and the thresholded images
figure;
subplot(2, 2, 1);
imshow(row_gradient, []);
title('Row Gradient (Drow)');

subplot(2, 2, 2);
imshow(col_gradient, []);
title('Column Gradient (Dcol)');

subplot(2, 2, 3);
imshow(dur_edges, []);
title(['Diagonal Upper-Right Edges (Dur), \tau = ', num2str(tau_dur)]);

subplot(2, 2, 4);
imshow(dul_edges, []);
title(['Diagonal Upper-Left Edges (Dul), \tau = ', num2str(tau_dul)]);
