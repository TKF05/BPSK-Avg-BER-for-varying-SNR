# BPSK-Avg-BER-for-varying-SNR
A simulation of the Bit Error Rate (BER) for a BPSK transmitter with varying Signal to Noise Ratios (SNR) in dB 

In BPSK (Binary Phase Shift Keying), each transmitted symbol has an amplitude of either $-1$ or $+1$:

x[n]∈{−1,+1}

Since the magnitude of every symbol is 1, the energy of each symbol is:

Es=∣x[n]∣2=1

Therefore, the average energy per BPSK symbol is:

Es=1

Noise Variance

The signal-to-noise ratio (SNR) is defined as the ratio between the signal energy and the noise variance:

SNR=Esσn2

Because the BPSK signal has an energy of $E_s = 1$, this becomes:

SNR=1σn2

Solving for the noise variance gives:

σn2=1SNR

If the SNR is given in decibels (dB), it must first be converted to linear scale:

SNRlinear=10SNRdB/10

Therefore, the noise variance is:

σn2=110SNRdB/10

Adding AWGN

Additive White Gaussian Noise (AWGN) is generated using a zero-mean Gaussian random variable:

r[n]∼N(0,1)

To obtain the desired noise variance, the random variable is scaled by the square root of the noise variance:

n[n]=σn2 r[n]

Since:

σn2=1SNR

the noise can be written as:

n[n]=1SNR r[n]

The noisy received signal is then:

y[n]=x[n]+n[n]

or equivalently:

y[n]=x[n]+1SNR r[n]
