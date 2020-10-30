% Jorge Avila - 1001543128 - CSE3313 Signal Processing
clc
clear
close all

%{
    
Problem Description: Write a MatLAB function that calculates the moving
average of an input sequence, x[n]. The function will take a sequence x[n]
and number of averaged elements (N) as inuts and output the moving average
sequence y[n]. The N- element moving average is given by:

y[n] = (1/N)[k=n-N+1] to [n] summation of ?x[k]

%}

% n = array size
% N = # is the number of array elements 
% x = is the array itself 

% ex variables
a = [1 2 3 4 5];
h = moving_average(a,3);
h2 = movmean(a,3);

function y = moving_average(x,N)
    array_size_n = length(x);
    y = zeros(1,array_size_n - N);
    for i = 1:array_size_n-N
        for j = 1:i+N-1
            y(i) = y(i) + x(j);
        end 
        y(i) = (1/N) * y(i);
    end
end


