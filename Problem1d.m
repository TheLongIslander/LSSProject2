% Define the values of c1 and c2
c1 = 2;
c2 = 5/4;

% Calculate the locations of the zero and pole
zero = -c1;
pole = c2;

% Create a new figure
figure;
hold on;

% Plot the zero (use 'o' for zero) and the pole (use 'x' for pole)
plot(real(zero), imag(zero), 'bo', 'MarkerSize', 10, 'LineWidth', 2); % Blue circle for zero
plot(real(pole), imag(pole), 'rx', 'MarkerSize', 10, 'LineWidth', 2); % Red 'x' for pole

% Add the unit circle
theta = linspace(0, 2*pi, 100);
x_unit = cos(theta);
y_unit = sin(theta);
plot(x_unit, y_unit, 'k--', 'LineWidth', 1); % Black dashed line for unit circle

% Add grid, axis labels, and title
grid on;
xlabel('Real Part');
ylabel('Imaginary Part');
title('Pole-Zero Plot with Unit Circle for c1 = 2 and c2 = 5/4');

% Set axis limits for a clear view
axis([-3 3 -3 3]);
axis equal; % Ensures the unit circle appears as a circle

% Add legend to identify poles, zeros, and unit circle
legend('Zero (z = -c1)', 'Pole (z = c2)', 'Unit Circle', 'Location', 'best');

hold off;
