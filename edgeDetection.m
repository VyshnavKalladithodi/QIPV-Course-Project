I1 = imread('mask1.jpg');
I = rgb2gray(I1);
I2 = edge(I);
I3 = imdilate(I2,true(3,3));
I4 = bwareaopen(~I3,1e4);

subplot(1,3,1)
imshow(I)       
title('Gray original')
subplot(1,3,2)
imshow(I3)
title({'edge()','imdilate()'})
subplot(1,3,3)
imshow(~I4)
title('bwareaopen()')
