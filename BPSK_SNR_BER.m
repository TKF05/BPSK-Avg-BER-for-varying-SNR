clc;
clear;
close all;
%-----------------------------------------------------------%

% iterate for many "noises" until BE is 100

num_bits = 1e6;
%define SNR range and step
snr_Db = 0:1:12;
disp(snr_Db);
snr_linear = 10.^(snr_Db/10); %de-logarithm it 
disp(snr_linear);
% -1 <= 0
% 1 <= 1
BER = zeros(size(snr_Db));

%test multiple SNR
for i = 1:length(snr_Db) % for each SNR
    count = 0;
    num_errors = 0;
    avg_ber = 0;
    while num_errors <= 1e5 
        data = randi([0,1], 1, num_bits); %create random bits
        bpsk_signal = 2*data - 1; 

        noise_variance = 1 / snr_linear(i);
        noise = sqrt(noise_variance) * randn(1, num_bits); %modify this 

        received_signal = bpsk_signal + noise;

        detected_signal = received_signal > 0;

        num_errors = num_errors + sum(data ~= detected_signal);

        count = count + 1;
    end
    disp(count);
    disp(num_errors);
    
    BER(i) = num_errors / (count * num_bits);
end

%graph
semilogy(snr_Db, BER, 'ro--');
grid on;

xlabel('SNR (dB)');
ylabel('Avg Bit Error Rate (BER)');
title('Avg BER vs SNR');
legend('Avg Bit Error Rate');
