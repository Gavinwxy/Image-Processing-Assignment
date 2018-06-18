M = 256; N = 256;
image = zeros(M,N);
box = ones(64,64);
image(97:160,97:160) = box;

figure(1);
imshow(image);

F=fft2(double(image));
figure(2);
imshow(abs(fftshift(F)));

u0=20;
u=0:(M-1);
v=0:(N-1);
idx=find(u>M/2);
u(idx)=u(idx)-M;
idy=find(v>N/2);
v(idy)=v(idy)-N;
[V,U]=meshgrid(v,u);
D =sqrt(U.^2+V.^2);
H=double(D<=u0);

figure(3);
imshow(fftshift(H));

G=H.*F;
g=real(ifft2(double(G)));

figure(4);
imshow(g);