function transformPowerImage = transformPowerImage(image, c, g)

    transformPowerImage = im2double(image);
    [row, col] = size(image);
    for i = 1:row
        for j = 1:col
            transformPowerImage(i,j) = c * (transformPowerImage(i,j)^g);
        end
    end
end