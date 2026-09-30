# BPSK-Avg-BER-for-varying-SNR

A simulation of the Bit Error Rate (BER) for a BPSK transmitter with varying Signal to Noise Ratios (SNR) in dB

In BPSK (Binary Phase Shift Keying), each transmitted symbol has an amplitude of either $-1$ or $+1$:

$$
x[n] \in \{-1,+1\}
$$

Since the magnitude of every symbol is 1, the energy of each symbol is:

$$
E_s = |x[n]|^2 = 1
$$

Therefore, the average energy per BPSK symbol is:

$$
E_s = 1
$$

## Noise Variance

The signal-to-noise ratio (SNR) is defined as the ratio between the signal energy and the noise variance:

$$
\mathrm{SNR} = \frac{E_s}{\sigma_n^2}
$$

Because the BPSK signal has an energy of $E_s = 1$, this becomes:

$$
\mathrm{SNR} = \frac{1}{\sigma_n^2}
$$

Solving for the noise variance gives:

$$
\sigma_n^2 = \frac{1}{\mathrm{SNR}}
$$

If the SNR is given in decibels (dB), it must first be converted to linear scale:

$$
\mathrm{SNR}_{\mathrm{linear}} = 10^{\mathrm{SNR}_{\mathrm{dB}}/10}
$$

Therefore, the noise variance is:

$$
\sigma_n^2 = \frac{1}{10^{\mathrm{SNR}_{\mathrm{dB}}/10}}
$$

## Adding AWGN

Additive White Gaussian Noise (AWGN) is generated using a zero-mean Gaussian random variable:

$$
r[n] \sim \mathcal{N}(0,1)
$$

To obtain the desired noise variance, the random variable is scaled by the square root of the noise variance:

$$
n[n] = \sqrt{\sigma_n^2}\,r[n]
$$

Since:

$$
\sigma_n^2 = \frac{1}{\mathrm{SNR}}
$$

the noise can be written as:

$$
n[n] = \sqrt{\frac{1}{\mathrm{SNR}}}\,r[n]
$$

The noisy received signal is then:

$$
y[n] = x[n] + n[n]
$$

or equivalently:

$$
y[n] = x[n] + \sqrt{\frac{1}{\mathrm{SNR}}}\,r[n]
$$
