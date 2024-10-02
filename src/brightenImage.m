function brightenedImage = brightenImage(image, a, b)

    image = double(image);

    brightenedImage = a * image + b;

    brightenedImage = min(max(brightenedImage, 0), 255);

    brightenedImage = uint8(brightenedImage);
end