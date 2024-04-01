function gambar=biner(gambar, trechul) 
    if trechul > 125
        gambar = im2bw(gambar, trechul/255);
    else
        gambar = im2bw(gambar, 0.1);
    end
end