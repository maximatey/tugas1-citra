function histEqImage = histEqImage(image)
    histEqImage = image;
    
    [row, col, depth] = size(image);

    for k = 1: depth
        numPixels = numel(image(:,:,depth));
        counts = zeros(256, 1);
        sums = zeros(256,1);
        % prepare array for convertion
        convertion = zeros(256,1);
        for i = 1:row
            for j = 1:col
                counts(histEqImage(i,j,k)+1) = counts(histEqImage(i,j,k)+1) + 1;
            end
        end

        % calculate s value for each value of gray level
        for i = 1:256
            for j = 1:i
                sums(i) = sums(i) + counts(j);
            end
        end

        % calculate the probability and convert to 255 graylevel value
        for i = 1:256
            convertion(i) = floor((sums(i)/numPixels)*255);
        end

        % convert each image to convertion value based on convertion array
         for i = 1:row
            for j = 1:col
                histEqImage(i,j,k) = convertion(histEqImage(i,j,k) + 1);
            end
        end
    end
end