function contrastStretchingImage = contrastStretchingImage(image)

    contrastStretchingImage = im2double(image);
    [row, col, depth] = size(image);

    for k = 1: depth
        layer = contrastStretchingImage(:,:,k);
        minLayer = min(layer(:));
        maxLayer = max(layer(:));
        for i = 1:row
            for j = 1:col
                contrastStretchingImage(i,j,k) = (contrastStretchingImage(i,j,k)-minLayer)/(maxLayer-minLayer);
            end
        end
    end
end