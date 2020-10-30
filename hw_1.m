% Jorge Avila - 1001543128 CSE3313 Signal Processing

%{
    Problem Description: This is M.1 on homework 1. 
%}

% clears and starts the program without anything on the screen
clc
clear
close all

% (a) create an array from indices -20 to 20
n = -20:20;

% (b) Create a sequence equal to the unit-step function u[n].
% unitstep = n >= 0;
unitstep = @(t) t >= 0;
% plot u[n] - the unitstep
subplot(2,2,1);
stem(n,unitstep(n));
xlabel('n indices');
ylabel('u[n]');
title('Plot of u[n]');

% Using what you created in (a) and (b) above, form the following sequence:
% x[n] = ((1/2)^n)(cos((2*pi*n)/13)u[n]
argument = ((2*pi.*n)/13);
x = ((.5).^n).*cos(argument);

% (c) now multiply it by the step function
x = x .* unitstep(n);

% plotting x[n]
subplot(2,2,2);
stem(n,x);
xlabel('n indices');
ylabel('x[n]');
title('Plot of x[n]');

% (d) Now create sequence h[n]:
% This is basically a PULSE that we have seen already

h = unitstep(n) - unitstep(n-3);

% plot h[n]
subplot(2,2,3);
stem(n,h);
xlabel('n indices');
ylabel('h[n]');
title('Plot of h[n]');

% (e) convolution
y = conv(x,h,'same');

% plot convolution y[n]
subplot(2,2,4);
stem(n,y);
xlabel('n indices');
ylabel('y[n]');
title('Plot of y[n]');