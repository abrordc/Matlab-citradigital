function [gambar, index]=abuabu(gambar, index) 
    R = gambar(:, :, 1);
    G = gambar(:, :, 2);
    B = gambar(:, :, 3);
    if index == 1
        gambar = max(max(R, G),B) + min(min(R, G),B) * 0.5;
    else if index == 2
        gambar = (R + G + B) / 3;
      else if index == 3
            gambar = 0.3 * R + 0.59 * G + 0.11 * B;
      end
    end
    end   
end