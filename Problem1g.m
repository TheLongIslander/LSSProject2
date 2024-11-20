% Define the values of c1 and c2
c1 = 1;
c2 = 0.9;

% Define the transfer function coefficients
num = [1, c1];   % Coefficients of the numerator
den = [1, -c2];  % Coefficients of the denominator

% Compute the frequency response
[H, w] = freqz(num, den, 'half');  % 'half' returns positive frequencies

% Convert magnitude to dB
magnitude_dB = 20 * log10(abs(H));

% Find the largest value of the magnitude (in linear scale)
[max_magnitude, max_index] = max(abs(H));

% Convert max magnitude to dB for reference
max_magnitude_dB = 20 * log10(max_magnitude);

% Find the frequency closest to 0 dB
[~, zero_dB_index] = min(abs(magnitude_dB));  % Find index where magnitude is closest to 0 dB
zero_dB_frequency = w(zero_dB_index) / pi;    % Normalized frequency in terms of π

% Display results
fprintf('Largest magnitude of the filter: %.4f (%.2f dB)\n', max_magnitude, max_magnitude_dB);
fprintf('Frequency value corresponding to 0 dB: %.4fπ radians/sample\n', zero_dB_frequency);
