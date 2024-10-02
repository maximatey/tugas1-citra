function histogramImage = imageHistogram(image)
    if size(image, 3) == 3
        % Convert RGB image to grayscale
        image = rgb2gray(image);
    end
    
    histogramCounts = zeros(256, 1);

    [rows, cols] = size(image);

    for r = 1:rows
        for c = 1:cols
            intensity = image(r, c) + 1;
            histogramCounts(intensity) = histogramCounts(intensity) + 1;
        end
    end

    figure;
    bar(0:255, histogramCounts, 'FaceColor', 'b');
    xlim([0 255]);
    xlabel('Gray Level');
    ylabel('Frequency');
    title('Image Histogram');
    grid on;

    histogramImage = histogramCounts;
end