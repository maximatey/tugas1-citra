function histMatchingImage = histMatchingImage(from, toImage)
 
    fromImage = from;
    [row, col, depth] = size(from);

    convertion = zeros(depth,256, 'double');
    for k = 1: depth
        numPixels = numel(from(:,:,depth));
        counts = zeros(256, 1);
        sums = zeros(256,1);
        for i = 1:row
            for j = 1:col
                counts(fromImage(i,j,k)+1) = counts(fromImage(i,j,k)+1) + 1;
            end
        end
        
        for i = 1:256
            for j = 1:i
                sums(i) = sums(i) + counts(j);
            end
        end
        for i = 1:256
            convertion(k,i) = floor((sums(i)/numPixels)*255);
        end
    end

    toImageVar = toImage;
    
    [row, col, depth] = size(toImage);
    conv = zeros(256,1);
    for k = 1: depth
        numPixels = numel(toImage(:,:,depth));
        counts = zeros(256, 1);
        sums = zeros(256,1);
        s = zeros(256,1);
        for i = 1:row
            for j = 1:col
                counts(toImage(i,j,k)+1) = counts(toImage(i,j,k)+1) + 1;
            end
        end
        
        for i = 1:256
            for j = 1:i
                sums(i) = sums(i) + counts(j);
            end
        end
        for i = 1:256
            s(i) = floor((sums(i)/numPixels)*255);
        end
        
        for i= 1:256
            [~,conv(i)] = min(abs(s(i) - convertion(k,:)));
        end
        for i = 1:row
            for j = 1:col
                toImageVar(i,j,k) = conv(toImageVar(i,j,k) + 1);
            end
        end
    end
    histMatchingImage = toImageVar;
end