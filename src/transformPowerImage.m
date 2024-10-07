function transformPowerImage = transformPowerImage(image, c, g)

    transformPowerImage = im2double(image);
    [row, col] = size(image);
    for i = 1:row
        for j = 1:col
            % apply power transfomation to image (each pixel wise)
            transformPowerImage(i,j) = c * (transformPowerImage(i,j)^g);
        end
    end
end