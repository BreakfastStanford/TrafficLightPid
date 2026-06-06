clear; close all; clc;
%1.750
% Define symbolic variable in the context of transfer function
s = tf("s");
kp = 2;
kd = .5;
ki = 8;
k  = 68  ;
controller = pid(kp,ki,kd);
sys = 3 / ((s+0.1) * (s + 0.5));
feedback_sys = feedback(controller * sys *k, 1);

rlocus(feedback_sys)

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


%open loop 
step(feedback_sys) 

% step data 
s_info = stepinfo(feedback_sys);

overshoot = s_info.Overshoot;
settling_time = s_info.SettlingTime;
risetime = s_info.RiseTime

fprintf('Proportional gain (kp): %2.3f\n', kp)
fprintf('Derivative gain (kd): %2    .3f\n', kd)
fprintf('Integral gain (ki): %2.3f\n', ki)
fprintf('Value of K: %2.3f\n', k)
fprintf('Percentage overshoot: %2.2f%%\n', overshoot)
fprintf('Settling time: %2.2f s\n\n', settling_time)
fprintf('Rise time: %2.2f s\n\n', risetime)

pause()
impulse(feedback_sys)

