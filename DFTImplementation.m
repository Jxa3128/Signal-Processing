% Jorge Avila - mavID: 1001543128

clc
clear
close all

% This project will require you to implement the DFT computation for a 
% given signal in a MATLAB script and compare your output to the output of 
% the MATLAB fft() function.

% formatSpec = '%1.4f\n';
formatSpec = '%f';
fp = fopen('correctsignal.txt','r');
numberArray = fscanf(fp,formatSpec);

% close the file pointer
fclose(fp);

arraySize = size(numberArray);
sampleSize = 1028;
n = -513:514;
n = n';

fprintf('Testing: The first %f\n',numberArray(15));

% really do not care what the x & y labels are.
% plot x[n]
subplot(4,4,1);
plot(n,numberArray);
xlabel('n and k values');
ylabel('x[n] and X[k]');
title('Plot of Numbers Generated');

% N is the size of the data
N = sampleSize;

% k is cycles per N samples
k = 1;

% summation of X_1(k)
for n_0 = 0:N-1
    expArgument = ((-1j*2*pi*n_0*k)/N);
    X1_k = (numberArray .* exp(expArgument));
end

% plotting the Magnitude of X1_k
subplot(4,4,2);
plot(n,abs(X1_k));
xlabel('n values');
ylabel('Magnitude Values');
title('Magnitude of X_1(k)')

% plotting the Phase of X1_k
subplot(4,4,3);
plot(n,angle(X1_k));
title('Phase of X_1(k)')
xlabel('n Values');
ylabel('Phase Values');

% use the matlab function fft() to calculate X_2(k) 
X2_k = fft(numberArray);

% plot the magnitude of X_2(k)
subplot(4,4,4);
plot(n,abs(X2_k));
title('Magnitude of X_2(k)');
xlabel('Magnitude');
ylabel('n Values');

% plot the phase of X_2(k)
subplot(4,4,5);
plot(n, angle(X2_k));
title('Phase of X_2(k)');
xlabel('Phase');
ylabel('n Values');


