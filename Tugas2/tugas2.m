clear;
clc;
close all;


gambar = imread('tugas2.jpg');

%percobaan program

%gray = rgb2gray(gambar);
%biner = im2bw(gray, 0.5);
%imshow(biner);


% 1 menggunakan metode lightness
% 2 menggunakan metode average
% 3 menggunakan metode luminosity
grey1 = abuabu(gambar, 1);
grey2 = abuabu(gambar, 2);
grey3 = abuabu(gambar, 3);

figure, imshow(gambar);title('gambar ori');
figure, imshow(grey1);
figure, imshow(grey2);
figure, imshow(grey3);

%untuk nilai > 125 maka biner lebih banyak 0
%untuk nilai < 125 maka biner lebih banyak 1

biner0 = biner(grey3, 126);
biner1 = biner(grey2, 124);

figure, imshow(biner0);title('biner 0');
figure, imshow(biner1);title('biner 1');