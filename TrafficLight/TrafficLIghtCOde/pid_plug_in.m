clear; close all; clc;
%1.750
% Define symbolic variable in the context of transfer function
s = tf("s");
kp = 1.75
kd = 15
ki = 100

controller = pid(kp,ki,kd)
sys = 3 / ((s+0.1) * (s + 0.5))
feedback_sys = feedback(controller * sys, 1);
%open loop
step(feedback_sys)

% step data 
s_info = stepinfo(feedback_sys);

overshoot = s_info.Overshoot;
settling_time = s_info.SettlingTime;
risetime = s_info.RiseTime

fprintf('Proportional gain (kp): %2.3f\n', kp)
fprintf('Derivative gain (kd): %2.3f\n', kd)
fprintf('Integral gain (ki): %2.3f\n', ki)
fprintf('Percentage overshoot: %2.2f%%\n', overshoot)
fprintf('Settling time: %2.2f s\n\n', settling_time)
fprintf('Rise time: %2.2f s\n\n', risetime)