% Read and convert image to grayscale
img = imread('WeeksHallSmall.jpg');
gray_img = rgb2gray(img);

% Define values of M for filtering
M_values = [2, 4, 8, 16, 32];

% Initialize figure for row-blurred images
figure;
for i = 1:length(M_values)
    M = M_values(i);
    % Create the filter (moving average kernel)
    filter_kernel = ones(1, M) / M;
    
    % Apply filter along rows
    row_blurred = filter(filter_kernel, 1, gray_img);
    
    % Display the row-blurred image
    subplot(2, length(M_values), i);
    imshow(row_blurred, []);
    title(['Row Blur, M = ', num2str(M)]);
end

% Initialize figure for column-blurred images
for i = 1:length(M_values)
    M = M_values(i);
    % Create the filter (moving average kernel)
    filter_kernel = ones(M, 1) / M;
    
    % Apply filter along columns
    col_blurred = filter(filter_kernel, 1, gray_img')'; % Transpose for column filtering
    
    % Display the column-blurred image
    subplot(2, length(M_values), i + length(M_values));
    imshow(col_blurred, []);
    title(['Column Blur, M = ', num2str(M)]);
end