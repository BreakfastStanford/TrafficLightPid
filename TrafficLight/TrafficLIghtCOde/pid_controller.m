clear; close all; clc;
%1.750
% Define symbolic variable in the context of transfer function
s = tf("s");
kp = 1.75
kd = 0
ki = 0
controller = pid(kp,ki,kd)
sys = 3 / ((s+0.1) * (s + 0.5))

%open loop
step(sys)

pause()

%closed loop
feedback_sys = feedback(sys, 1);
step(feedback_sys)

% step data
s_info = stepinfo(feedback_sys);

overshoot = s_info.Overshoot;
settling_time = s_info.SettlingTime;

fprintf('Proportional gain (kp): %2.3f\n', kp)
fprintf('Percentage overshoot: %2.2f%%\n', overshoot)
fprintf('Settling time: %2.2f s\n\n', settling_time)

pause()


% Root-locus plot
if kp == 0
    rlocus(sys)
    axis([-22 3 -15 15])
    
    sgrid
    
    [kp, poles] = rlocfind(sys);
    
    
    % feedback system with unit gain
    sys_cl = feedback(kp * sys, 1); 
    
    % get the step response
    figure
    step(sys_cl)
    s_info = stepinfo(sys_cl);
    
    overshoot = s_info.Overshoot;
    settling_time = s_info.SettlingTime;
    
    fprintf('Proportional gain (kp): %2.3f\n', kp)
    fprintf('Percentage overshoot: %2.2f%%\n', overshoot)
    fprintf('Settling time: %2.2f s\n\n', settling_time)
    
    pause()
end

%find kd
for kd = 0:2
    controller = pid(kp,ki,kd)
    sys = 3 / ((s+0.1) * (s + 0.5))
    feedback_sys = feedback(controller * sys, 1);
   %% step(feedback_sys)
    
    % step data
    s_info = stepinfo(feedback_sys);
    
    overshoot = s_info.Overshoot;
    settling_time = s_info.SettlingTime;
    
    fprintf('Proportional gain (kp): %2.3f\n', kp)
    fprintf('Derivative gain (kd): %2.3f\n', kd)
    fprintf('Percentage overshoot: %2.2f%%\n', overshoot)
    fprintf('Settling time: %2.2f s\n\n', settling_time)

   % if settling_time <= 3 & overshoot <= 5
    %    break
    %end
end


%output latest 
step(feedback_sys)

% step data
s_info = stepinfo(feedback_sys);

overshoot = s_info.Overshoot;
settling_time = s_info.SettlingTime;

fprintf('Proportional gain (kp): %2.3f\n', kp)
 fprintf('Derivative gain (kd): %2.3f\n', kd)
fprintf('Percentage overshoot: %2.2f%%\n', overshoot)
fprintf('Settling time: %2.2f s\n\n', settling_time)

pause()

% final plot
%kp = 1.75
%kd = 2
%ki = 0
%controller = pid(kp,ki,kd)
%sys = 3 / ((s+0.1) * (s + 0.5))


%closed loop PID
%fprintf('Final Ouput \n')

%feedback_sys = feedback(controller * sys, 1);
%step(feedback_sys) 

%s_info = stepinfo(feedback_sys);  
%overshoot = s_info.Overshoot;
%settling_time = s_info.SettlingTime;

%fprintf('Proportional gain (kp): %2.3f\n', kp)
%fprintf('Percentage overshoot: %2.2f%%\n', overshoot)
%fprintf('Settling time: %2.2f s\n\n', settling_time)

%pause()

