function contrastStretchingImage = contrastStretchingImage(image)

    contrastStretchingImage = im2double(image);
    [row, col, depth] = size(image);

    for k = 1: depth
        layer = contrastStretchingImage(:,:,k);

        % get minimum value in the layer
        minLayer = min(layer(:));

        % get maximum value in layer
        maxLayer = max(layer(:));
        for i = 1:row
            for j = 1:col
                % apply contrast strecthing according to min max value
                contrastStretchingImage(i,j,k) = (contrastStretchingImage(i,j,k)-minLayer)/(maxLayer-minLayer);
            end
        end
    end
end