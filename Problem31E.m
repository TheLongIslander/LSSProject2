% Read the original image
img = imread('WeeksHallSmall.jpg');
gray_img = rgb2gray(img);

% Define the custom 5x5 diagonal filter to detect the downward slope
D_roof = [0  0  0  0 -1; 
          0  0  0 -1  0; 
          0  0  1  0  0; 
          0 -1  0  0  0; 
         -1  0  0  0  0];

% Apply the 2D convolution using the custom filter
roof_gradient = conv2(double(gray_img), D_roof, 'same');

% Define a threshold for edge detection
tau_roof = 25; % Experimentally chosen threshold

% Threshold the result
roof_edges = abs(roof_gradient) > tau_roof;

% Display the filtered result and the thresholded image
figure;
subplot(1, 2, 1);
imshow(roof_gradient, []);
title('Filtered Image with Roof Gradient (D\_roof)');

subplot(1, 2, 2);
imshow(roof_edges, []);
title(['Thresholded Roof Edges (\tau = ', num2str(tau_roof), ')']);
