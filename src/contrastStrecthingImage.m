function contrastStrecthingImage = contrastStrecthingImage(image)

    contrastStrecthingImage = im2double(image);
    [row, col, depth] = size(image);

    for k = 1: depth
        layer = contrastStrecthingImage(:,:,k);
        minLayer = min(layer(:));
        maxLayer = max(layer(:));
        for i = 1:row
            for j = 1:col
                contrastStrecthingImage(i,j,k) = (contrastStrecthingImage(i,j,k)-minLayer)/(maxLayer);
            end
        end
    end
end