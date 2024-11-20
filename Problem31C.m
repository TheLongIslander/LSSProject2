% Read the original image
img = imread('WeeksHallSmall.jpg');

% Choose row 230 for analysis
row_230 = img(230, :, :); % Extract row 230 (keep RGB if applicable)

% Plot row 230 of the original image
figure;
stem(1:size(row_230, 2), double(row_230(:, :, 1)), 'b');
title('Row 230 of Original Image (Red Channel)');
xlabel('Pixel Index');
ylabel('Pixel Intensity');
hold on;

% Identify edges in the original image (by observation, manually pick)
% Example: Manually mark where you observe light-to-dark and dark-to-light edges
xline(50, 'r--', 'Light-to-Dark Edge'); % Example indices
xline(150, 'g--', 'Dark-to-Light Edge');

% First Difference Filter
c = [1, -1]; % Define the first difference filter
filtered_row = filter(c, 1, double(row_230(:, :, 1))); % Apply to red channel

% Plot filtered row 230
figure;
stem(1:size(filtered_row, 2), filtered_row, 'b');
title('Filtered Row 230 (First Difference Filter)');
xlabel('Pixel Index');
ylabel('Edge Magnitude');
hold on;

% Thresholding
tau_values = [1, 50]; % Define thresholds
for tau = tau_values
    % Thresholded edges
    thresholded_edges = abs(filtered_row) > tau;
    
    % Plot thresholded results
    figure;
    stem(1:size(thresholded_edges, 2), thresholded_edges, 'r');
    title(['Thresholded Edges (Tau = ', num2str(tau), ')']);
    xlabel('Pixel Index');
    ylabel('Edge Detected');
end

% Apply filter to all rows and columns of the image
filtered_img_rows = imfilter(double(img), c, 'replicate', 'conv'); % Filter rows
filtered_img_cols = imfilter(double(img), c', 'replicate', 'conv'); % Filter columns

% Display results for rows and columns
figure;
imagesc(filtered_img_rows);
title('Filtered Image - Rows');
colorbar;

figure;
imagesc(filtered_img_cols);
title('Filtered Image - Columns');
colorbar;