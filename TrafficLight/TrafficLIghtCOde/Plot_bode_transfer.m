% Bode diagram

% symbolic variable `s`
s = tf('s');

% Open-loop system
%               s + 10
%  G(s) = ---------------------
%          (s + 1)^2 (s + 100)
%sys = .5 / ((s+10) * (s + 50))
%sys = .5 * (s+10) / ((s+10) * (s + 50))
sys = 3 / ((s+.1) * (s + .5))
% diagram
bode(sys);
title("bode diagram")
legend(["Open-loop", "Closed-loop"], "Location", "northeast");