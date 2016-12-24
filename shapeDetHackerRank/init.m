aa = imread('img01.png');
bb = rgb2gray(aa);
%%

threshImage = double(bb<140);
Gx = [1 +2 +1; 0 0 0; -1 -2 -1]; Gy = Gx';
temp_x = conv2(threshImage, Gx, 'same');
temp_y = conv2(threshImage, Gy, 'same');