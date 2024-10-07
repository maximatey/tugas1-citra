function histogramImage = imageHistogram(image)
    if size(image, 3) == 3
        % Convert RGB image to grayscale
        image = rgb2gray(image);
    end
    % initiate counter array
    histogramCounts = zeros(256, 1);
    
    [rows, cols] = size(image);
    % iterate through all pixel in image and count frequency
    for r = 1:rows
        for c = 1:cols
            intensity = image(r, c) + 1;
            intensity = floor(intensity);
            histogramCounts(intensity) = histogramCounts(intensity) + 1;
        end
    end
    % return counter array
    histogramImage = histogramCounts;
end