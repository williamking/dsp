wp = 3 * 2.0 / 15;
ws = 5 * 2.0 / 15;
wc = (wp + ws) / 2;

alphaP = 1 - 10 ^ (0.3 / -20);
alphaS = 10 ^ (40 / -20);

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
  disp(i);
  if i == 4
    [n, Wn, beta, ftype] = kaiserord([wp, ws], [1, 0], [alphaP, alphaS]); 
    M = n / 2;
    win = kaiser(n+1, beta);
    n = -M : M;
  end
  if i == 3
    M = ceil(5.56 / (ws - wp))
    n = 2 * M;
    win = blackman(n+1);
    n = -M : M;
  end
  if i == 2
    M = ceil(3.32 / (ws - wp))
    n = 2 * M;
    win = hanning(n+1);
    n = -M : M;
  end
  if i == 1
    M = ceil(3.11 / (ws - wp));
    n = 2 * M;
    win = hamming(n+1);
    n = -M : M;
  end
  
  hd = sin(wc * pi * n) ./ (pi * n);
  hd(find(n==0)) = wc;

  subplot(1,3,1);
  plot(n, hd, '-');
  title('ideal impulse response');
  xlabel('n');
  ylabel('hd');
  
  subplot(1,3,2);
  disp(hd);
  disp(win)
  ht = hd .* win';
  plot(n, ht, '-');
  title(titles(i));
  xlabel('n');
  ylabel('hd');
  grid on;

  subplot(1,3,3);
  [h, w] =freqz(ht, 1, 512);
  w = w / pi;
  h = 20 * log10(abs(h));
  plot(w, h, '-');
  title(titles2(i));
  xlabel('pi(w/s)');
  ylabel('gain(db)');
  grid on;
  
end






