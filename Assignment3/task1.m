%%
x = [1:256];
plot(x);
xlim([1,256]);
x_dft = fft(x);
x_dct = dct(x);
x_dft_tmp = x_dft;
x_dct_tmp = x_dct;
dft_shift = fftshift(x_dft);
figure;
plot(abs(dft_shift));
xlim([1,256]);
pctg = [32,64,96,128,160,192,224];
psnr_dft = zeros([1,7]);
psnr_dct = zeros([1,7]);
%%
figure;
for i=1:1:7
    index = 256-(pctg(i)-1);
    % DFT
    x_dft = x_dft_tmp; 
    x_dft(index:256) = 0;
    x_idft = ifft(x_dft);
    subplot(2,4,i);
    plot(abs(x_idft));
    xlim([0,255]);
    title(['Percentage=' num2str(pctg(i))]);
    psnr_dft(i) = psnr(abs(x_idft),x);
end
%%
figure;
for i=1:1:7
    index = 256-(pctg(i)-1);
    % DCT
    x_dct = x_dct_tmp;
    x_dct(index:256)=0;
    x_idct = idct(x_dct);
    subplot(2,4,i)
    plot(abs(x_idct));
    xlim([0,255])
    title(['Percentage=' num2str(pctg(i))]);
    psnr_dct(i) = psnr(x_idct,x);
end

