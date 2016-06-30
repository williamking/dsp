alphaP = 1 - 10 ^ (0.3 / -20);
alphaS = 10 ^ (40 / -20);

wp = 3 * 2.0 / 15;
ws = 5 * 2.0 / 15;
wc = (wp + ws) / 2;

alphaP = 1 - 10 ^ (0.3 / -20);
alphaS = 10 ^ (40 / -20);

figure(1);
fcuts = [3.0/15*2, 5.0/15*2];
mags = [1, 0];
devs = [alphaP, alphaS];

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


for i = 1 : 4
  figure(i);
  
  if i == 4
    [n, Wn, beta, ftype] = kaiserord([wp, ws], [1, 0], [alphaP, alphaS]); 
    M = n / 2;
    win = kaiser(n+1, beta);
  end
  if i == 3
    M = ceil(5.56 / (ws - wp))
    n = 2 * M;
    win = blackman(n+1);
  end
  if i == 2
    M = ceil(3.32 / (ws - wp))
    n = 2 * M;
    win = hanning(n+1);
  end
  if i == 1
    M = ceil(3.11 / (ws - wp));
    n = 2 * M;
    win = hamming(n+1);
  end
  
  x = -M : M;
  
  subplot(1,2,1);
  hh = fir1(n, wc, win);
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
