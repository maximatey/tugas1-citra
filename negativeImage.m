function negativeImage = negativeImage(image)

    image = double(image);

    negativeImage = 255-image;

    negativeImage = uint8(negativeImage);
end