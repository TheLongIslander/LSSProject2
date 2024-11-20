% Define the new values of c1 and c2
c1 = 1;
c2 = 0.9;

% Define the transfer function H(z) = (z + c1) / (z - c2)
num = [1, c1];   % Coefficients of the numerator (z + c1)
den = [1, -c2];  % Coefficients of the denominator (z - c2)

% Create the transfer function
H = tf(num, den, -1); % '-1' specifies a discrete-time system in MATLAB

% Plot the pole-zero diagram using pzplot
figure;
pzplot(H);
grid on;

% Add title
title('Pole-Zero Plot for c1 = 1 and c2 = 0.9');
