function histMatchingImage = histMatchingImage(from, toImage)
 
    fromImage = from;
    [row, col, depth] = size(from);
    % prepare array for value convertion
    convertion = zeros(depth,256, 'double');
    for k = 1: depth
        numPixels = numel(from(:,:,depth));
        counts = zeros(256, 1);
        sums = zeros(256,1);

        % count graylevel frequency from reference image
        for i = 1:row
            for j = 1:col
                counts(fromImage(i,j,k)+1) = counts(fromImage(i,j,k)+1) + 1;
            end
        end
        % calculate the s value for each element in convertion
        for i = 1:256
            for j = 1:i
                sums(i) = sums(i) + counts(j);
            end
        end

        % calculate the value for convertion
        for i = 1:256
            convertion(k,i) = floor((sums(i)/numPixels)*255);
        end
    end

    toImageVar = toImage;
    
    [row, col, depth] = size(toImage);

    % prepare array for convertion
    conv = zeros(256,1);
    for k = 1: depth
        numPixels = numel(toImage(:,:,depth));
        counts = zeros(256, 1);
        sums = zeros(256,1);
        s = zeros(256,1);
        
        % count graylevel frequency from target image
        for i = 1:row
            for j = 1:col
                counts(toImage(i,j,k)+1) = counts(toImage(i,j,k)+1) + 1;
            end
        end
        
        % calculate the s value for each element in conv array
        for i = 1:256
            for j = 1:i
                sums(i) = sums(i) + counts(j);
            end
        end

        % calculate the value for convertion
        for i = 1:256
            s(i) = floor((sums(i)/numPixels)*255);
        end
        
        % get the minimum value for each element in conv from convertion
        for i= 1:256
            [~,conv(i)] = min(abs(s(i) - convertion(k,:)));
        end

        % transform each element from target image according to conv array
        for i = 1:row
            for j = 1:col
                toImageVar(i,j,k) = conv(toImageVar(i,j,k) + 1);
            end
        end
    end
    histMatchingImage = toImageVar;
end