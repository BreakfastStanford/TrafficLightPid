clear; close all; clc;

% Define symbolic variable in the context of transfer function
s = tf("s");


sys = 3 / ((s+0.1) * (s + 0.5))
feedback_sys = feedback(sys, 1);
% Compute poles and zeros
poles = pole(feedback_sys);
disp('The poles are:');
for i = 1:length(poles)
    fprintf('Pole %d = %s\n', i, num2str(poles(i), 4));
end

zeros = zero(feedback_sys);
disp('The zeros are:');
for i = 1:length(zeros)
    fprintf('Zero %d = %2.3f\n', i, zeros(i));
end


% Plot poles and zeros
figure('Name', 'Overdamped system', 'Units', 'normalized', 'Position', [0.1 0.1 0.6 0.45]);

ax1 = subplot(1, 2, 1);
hold on
scatter(real(poles), imag(poles), 100, 'Marker', 'x', 'MarkerEdgeColor', 'r');
scatter(real(zeros), imag(zeros), 100, 'Marker', 'o', 'MarkerEdgeColor', 'b');
xline(0, 'k')
yline(0, 'k')
legend({"Poles", "Zeros"})
title('Poles and Zeros Plot');

set(ax1, 'FontSize', 12)

timeEnd = 30
% Compute time-domain response
t = linspace(0, timeEnd, 1000); % adjust time vector as needed
c = step(feedback_sys, t);

% Plot time-domain response
ax2 = subplot(1, 2, 2);
plot(t, c * 1.25);
title('Time-Domain Step Response');
xlabel('Time');
ylabel('Amplitude');

set(ax2, 'FontSize', 12)