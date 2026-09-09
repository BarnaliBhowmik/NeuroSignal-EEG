clear;
clc;
close all;

load("EEG_Fp1.mat");

whos
%% 

fprintf("Sampling frequency: %.1f Hz\n", fs);
fprintf("Samples: %d\n", length(eeg));
fprintf("Duration: %.3f seconds\n", time(end));
%% 

figure;

plot(time, eeg);

xlabel("Time (s)");
ylabel("Amplitude (V)");
title("Raw EEG Signal — Fp1");

grid on;
%% FFT Analysis

N = length(eeg);

Y = fft(eeg);

P2 = abs(Y/N);

P1 = P2(1:floor(N/2)+1);

P1(2:end-1) = 2*P1(2:end-1);

f = fs*(0:floor(N/2))/N;

figure;

plot(f, P1);

xlim([0 50]);

xlabel("Frequency (Hz)");
ylabel("Amplitude");

title("EEG Fp1 — Frequency Spectrum");

grid on;