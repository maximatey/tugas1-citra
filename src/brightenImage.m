function brightenedImage = brightenImage(image, a, b)

    image = double(image);
    % apply transformation to image (each pixel wise)
    brightenedImage = a * image + b;
    % prevent value over 255 and below 0
    brightenedImage = min(max(brightenedImage, 0), 255);
    % return transformed image
    brightenedImage = uint8(brightenedImage);
end