%===================================================================
%       This script contains a function that is used
%       in order to generate a pulse input.
%===================================================================

%% CREATING A PULSE INPUT 
function [u,t] = input_generator(T_begin, T_final, amplitude, pulse_start, pulse_stop)
stepsize = 0.001;
t = T_begin:stepsize:T_final-stepsize;
u = [zeros((pulse_start-T_begin)/stepsize,1);ones((pulse_stop-pulse_start)/stepsize,1)*amplitude;zeros((T_final-pulse_stop)/stepsize,1)];
end