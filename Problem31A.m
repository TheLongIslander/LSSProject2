% Read the image into MATLAB
img = imread('WeeksHallSmall.jpg');

% Display the original image
figure;
imshow(img);
title('Original Image');

% Convert the image to grayscale
gray_img = rgb2gray(img);

% Display the grayscale image to verify conversion
figure;
imshow(gray_img);
title('Grayscale Image');

% Convert the grayscale image from uint8 to double-precision
gray_img_double = double(gray_img);

% Calculate the average pixel value (intensity) of the grayscale image
average_intensity = mean(gray_img_double(:));

% Display the average intensity
disp(['The average intensity of the grayscale image is: ', num2str(average_intensity)]);
