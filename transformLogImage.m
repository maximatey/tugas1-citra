function transformLogImage = transformLogImage(image, c)

    transformLogImage = im2double(image);
    [row, col] = size(image);
    for i = 1:row
        for j = 1:col
            transformLogImage(i,j) = c * log(transformLogImage(i,j) + 1);
        end
    end

end