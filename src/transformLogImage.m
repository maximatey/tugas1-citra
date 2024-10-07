function transformLogImage = transformLogImage(image, c)

    transformLogImage = im2double(image);

    % return image to 255 base graylevel
    transformLogImage = transformLogImage*255;

    % apply transformation to image
    transformLogImage = c * log(transformLogImage + 1);
    % normalize image
    transformLogImage = transformLogImage/(max(max(transformLogImage)));

end