function negativeImage = negativeImage(image)

    image = double(image);
    % apply transformation to image
    negativeImage = 255-image;
    % return transformed image
    negativeImage = uint8(negativeImage);
end