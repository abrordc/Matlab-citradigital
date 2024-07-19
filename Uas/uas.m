image = imread('uas.jpeg');
figure;
imshow(image, 'InitialMagnification', 'fit');
title('Gambar Asli');
gray = rgb2gray(image);
blurred = imgaussfilt(gray, 2);
edges = edge(blurred, 'Canny');
figure;
imshow(edges, 'InitialMagnification', 'fit');
title('Deteksi Tepi');
[B, L] = bwboundaries(edges, 'noholes');
figure;
imshow(image, 'InitialMagnification', 'fit');
hold on;
numUjung = [];
for k = 1:length(B)
    boundary = B{k};
    plot(boundary(:,2), boundary(:,1), 'g', 'LineWidth', 2);
    if length(boundary) >= 3
        K = convhull(boundary(:,2), boundary(:,1));
        numUjung = [numUjung, length(K) - 1];
        centroid = regionprops(L == k, 'Centroid');
        text(centroid.Centroid(1), centroid.Centroid(2), sprintf('Objek %d: %d Ujung', k, numUjung(end)), 'Color', 'r', 'FontSize', 12);
    else
        numUjung = [numUjung, 0];
        centroid = regionprops(L == k, 'Centroid');
        text(centroid.Centroid(1), centroid.Centroid(2), sprintf('Objek %d: Tidak Cukup Titik', k), 'Color', 'r', 'FontSize', 12);
    end
end
hold off;
title('Deteksi Objek dan Jumlah Ujung');
fprintf('Ada %d Objek\n', length(B));
for i = 1:length(numUjung)
    if numUjung(i) > 0
        fprintf('Objek %d Ada %d Ujung\n', i, numUjung(i));
    else
        fprintf('Objek %d Tidak Cukup Titik untuk Dihitung\n', i);
    end
end