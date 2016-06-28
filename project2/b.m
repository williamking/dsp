alphaP = 1 - 10 ^ (0.3 / -20);
alphaS = 10 ^ (40 / -20);

figure(1);
fcuts = [3.0/15*2, 5.0/15*2];
mags = [1, 0];
devs = [alphaP, alphaS];
[n, Wn, beta, ftype] = kaiserord(fcuts, mags, devs);
hh = fir1(n, Wn, ftype, kaiser(n+1, beta), 'noscale');
freqz(hh);

figure(2);
hh = fir1(n, Wn, ftype, hamming(n+1), 'noscale');
freqz(hh);

figure(3);
hh = fir1(n, Wn, ftype, hanning(n+1), 'noscale');
freqz(hh);

figure(4);
hh = fir1(n, Wn, ftype, blackman(n+1), 'noscale');
freqz(hh);
