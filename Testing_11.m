
image = imread('Refined images/tissue.jpg');

blue = image(:,:,3);

en_image = blue;

br_image = imlocalbrighten(en_image,0.5);

re_image = imreducehaze(br_image);

sh_image = imsharpen(re_image,'Radius',1,'Amount',0.4);

stretched_image = imadjust(sh_image,stretchlim(sh_image,[0.3 0.9]),[]);

hist_image = histeq(stretched_image);

bin_image = hist_image < 240;

neg_image = imcomplement(bin_image);

bw_image = bwareaopen(neg_image,2000);

fill_image = imfill(bw_image,'holes');

[bwLabel,num] = bwlabel(fill_image,8);

props = regionprops(fill_image,'Eccentricity','Area','BoundingBox');
areas = [props.Area];
eccentricities = [props.Eccentricity];
index = find(eccentricities);
numobj = props(index);
 
figure 
imshow(image);
title('Final Image');
hold on;
 for idx = 1 : length(index)
     rectangle('Position',numobj(idx).BoundingBox,'EdgeColor','r','LineWidth',1.5);
     hold on;
 end
 
figure;
subplot(2,6,1);
imshow(image)
title('Original Image');

subplot(2,6,2);
imshow(en_image)
title('Blue Channel Image');

subplot(2,6,3);
imshow(br_image)
title('Bright Image');

subplot(2,6,4);
imshow(re_image)
title('Reduced Haze Image');

subplot(2,6,5);
imshow(sh_image)
title('Sharpened Image');
 
subplot(2,6,6);
imshow(stretched_image)
title('Contrast Stretch');

subplot(2,6,7);
imshow(hist_image)
title('Histogram Equalised');

subplot(2,6,8);
imshow(bin_image)
title('Binary');

subplot(2,6,9);
imshow(neg_image)
title('Complementary');

subplot(2,6,10);
imshow(bw_image)
title('Small objects Removed');

subplot(2,6,11);
imshow(fill_image)
title('Filled objects');
