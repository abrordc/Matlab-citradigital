% Pastikan Computer Vision Toolbox sudah terinstall

% 1. Baca gambar
img = imread('okegass.jpg'); % Ganti dengan path gambar yang ingin kamu deteksi wajahnya

% 2. Buat detektor wajah
faceDetector = vision.CascadeObjectDetector();

% 3. Deteksi wajah
bbox = step(faceDetector, img);

% 4. Hitung jumlah wajah yang terdeteksi
numFaces = size(bbox, 1);

% 5. Tampilkan hasil
% Buat kotak di sekitar wajah yang terdeteksi
detectedImg = insertShape(img, 'Rectangle', bbox, 'LineWidth', 3);

% Tampilkan gambar asli dan gambar dengan deteksi wajah
figure;
subplot(1,2,1);
imshow(img);
title('Gambar Asli');

subplot(1,2,2);
imshow(detectedImg);
title(['Gambar dengan Deteksi Wajah, Jumlah Wajah: ', num2str(numFaces)]);

% Tampilkan jumlah wajah yang terdeteksi di command window
disp(['Jumlah wajah yang terdeteksi: ', num2str(numFaces)]);
