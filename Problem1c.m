% Define the values of c1 and c2
c1 = 2;
c2 = 5 / 4;

% Define the zero and pole locations
zero = -c1;
pole = c2;

% Create a new figure
figure;
hold on;

% Plot the unit circle
theta = linspace(0, 2*pi, 100);
plot(cos(theta), sin(theta), 'b:', 'LineWidth', 1); % Dotted blue unit circle

% Plot the zero with a large yellow circle (at z = -c1)
plot(real(zero), imag(zero), 'yo', 'MarkerSize', 12, 'MarkerFaceColor', 'y');

% Plot the pole with a large red "X" (at z = c2)
plot(real(pole), imag(pole), 'rx', 'MarkerSize', 12, 'LineWidth', 2);

% Set plot limits for better visualization
xlim([-3, 3]);
ylim([-3, 3]);

% Add grid, title, and labels
grid on;
title('Pole-Zero Diagram for c1 = 2 and c2 = 5/4');
xlabel('Real Part');
ylabel('Imaginary Part');

% Add legend to clarify the symbols
legend('Unit Circle', 'Zero (z = -c1)', 'Pole (z = c2)', 'Location', 'best');

hold off;
