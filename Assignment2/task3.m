%%
black = [0,0,0];
blue = [0,0,1];
red = [1,0,0];
green = [0,0.5,0];
yellow = [1,0.5,0];
gray = [0.5,0.5,0.5];
%%
p1=[100,50];p2=[150,200];
x = 0:1:255;
x2=p1(1);y2=p1(2);
x3=p2(1);y3=p2(2);
%%
im = imread('lenna512_low_dynamic_range.bmp');
ref = imread('lenna512.bmp');
[eh_im,k1,k2,k3,b2,b3] = plf_eh(im,p1,p2);
figure;imshow(eh_im); 
%figure;imhist(im_low_dynamic_range); 
figure;imhist(eh_im); title('Histogram of Mapping Function D','fontsize',14)
y=(x<x2).*x*k1+(x>=x2&x<=x3).*(x*k2+b2)+(x>x3).*(x*k3+b3);
figure; 
plot(x,y,'LineWidth',2,'Color',blue);
hold on;
plot(x2,y2,'.','MarkerEdgeColor',red,'MarkerSize',20);
plot(x3,y3,'.','MarkerEdgeColor',red,'MarkerSize',20);
plot([x2,x2],[0,255],'--','LineWidth',2,'Color',yellow);
plot([x3,x3],[0,255],'--','LineWidth',2,'Color',yellow);
xlabel('Input gray level,x','fontSize',12);
ylabel('Output gray level,y','fontSize',12);
title('Piece-wise Linear Mapping Function D','fontsize',14);
xlim([0,255]);
ylim([0,255]);
%imwrite(eh_im,'F:\OneDrive\Assignment\EEE330_IP\Assignment2\fig\task2\im_D.jpg')
psnr = psnr_cal(eh_im,ref);


