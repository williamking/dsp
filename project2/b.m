alphaP = 1 - 10 ^ (0.3 / -20);
alphaS = 10 ^ (40 / -20);

figure(1);
fcuts = [3.0/15*2, 5.0/15*2];
mags = [1, 0];
devs = [alphaP, alphaS];
[n, Wn, beta, ftype] = kaiserord(fcuts, mags, devs);

kaiser_win = kaiser(n+1, beta);
hamm_win = hamming(n+1);
hann_win = hanning(n+1);
blackman_win = blackman(n+1);

wins = [hamm_win, hann_win, blackman_win, kaiser_win]
titles = {
    'hamm impluse response',
    'hann impluse response',
    'blackman impluse response',
    'kaiser impluse response'
    };
  
titles2 = {
    'hamm gain response',
    'hann gain response',
    'blackman gain response',
    'kaiser gain response'
    };

x = -n/2 : n/2;

for i = 1 : 4
  figure(i);
  
  subplot(1,2,1);
  hh = fir1(n, Wn, ftype, kaiser(n+1, beta));
  plot(x, hh, '-');
  title(titles(i));
  xlabel('n');
  ylabel('hd')
  grid on;
  
  subplot(1,2,2);
  [h, w] =freqz(hh, 1, 512);
  w = w / pi;
  h = 20 * log10(abs(h));
  plot(w, h, '-');
  title(titles2(i));
  xlabel('pi(w/s)');
  ylabel('gain(db)');
  grid on;

end
