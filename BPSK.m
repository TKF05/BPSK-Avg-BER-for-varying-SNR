clc;
clear;
close all;
%--------------------------------------------------------------------%

%define
num_bits = 100;
snr_Db = 5;

data = randi([0,1], 1, num_bits);

% -1 <= 0
% 1 <= 1
bpsk_keys = 2*data - 1;


noise_variance = 10^(-snr_Db/10);
noise = sqrt(noise_variance) * randn(size(bpsk_keys));
received_signal = bpsk_keys + noise;

detected_bits = received_signal > 0;
bit_errors = sum(detected_bits ~= data);
bit_error_rate = bit_errors / num_bits;


%graph
fprintf('Bit errors: %d\n', bit_errors);
fprintf('BER: %.4f\n', bit_error_rate);
figure;
stem(data, 'filled');
hold on;
stem(detected_bits, 'r--');
grid on;
legend('Transmitted bits', 'Detected bits');
xlabel('Bit index');
ylabel('Amplitude');
title(sprintf('BPSK Detection (BER = %.4f)', bit_error_rate));
hold off;