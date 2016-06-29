wp = 3 * 2.0 / 15;
ws = 5 * 2.0 / 15;
wc = (wp + ws) / 2;

alphaP = 1 - 10 ^ (0.3 / -20);
alphaS = 10 ^ (40 / -20);

[n, Wn, beta, ftype] = kaiserord([wp, ws], [1, 0], [alphaP, alphaS]);

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

M = n / 2;
n = -M : M;
hd = sin(wc * pi * n) ./ (pi * n);
hd(find(n==0)) = wc;

figure(1);
plot(n, hd, '-');
title('ideal impulse response');
xlabel('n');
ylabel('hd');

for i = 1 : 4
  figure(i + 1);
  
  subplot(1,2,1);
  ht = hd .* wins(i);
  plot(n, ht, '-');
  title(titles(i));
  xlabel('n');
  ylabel('hd');
  grid on;

  subplot(1,2,2);
  [h, w] =freqz(ht, 1, 512);
  w = w / pi;
  h = 20 * log10(abs(h));
  plot(w, h, '-');
  title(titles2(i));
  xlabel('pi(w/s)');
  ylabel('gain(db)');
  grid on;
  
end






