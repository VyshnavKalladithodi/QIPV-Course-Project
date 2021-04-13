
image = imread('Pictures\tissue2.jpeg');

re_image = imreducehaze(image);

sh_image = imsharpen(re_image,'Radius',1,'Amount',0.5);

stretched_image = imadjust(sh_image,stretchlim(re_image,[0.3 0.9]),[]);

% hist_image = histeq(stretched_image,80);

g_image = im2gray(stretched_image);

bin_image = g_image < 230;

neg_image = imcomplement(bin_image);

bw_image = bwareaopen(neg_image,1500);

fill_image = imfill(bw_image,'holes');

[bwLabel,num] = bwlabel(fill_image,8);

props = regionprops(fill_image,'Eccentricity','Area','BoundingBox');
areas = [props.Area];
eccentricities = [props.Eccentricity];
idxOfSkittles = find(eccentricities);
statsDefects = props(idxOfSkittles);
 
figure 
imshow(image);
title('Final Image');
hold on;
 for idx = 1 : length(idxOfSkittles)
     h = rectangle('Position',statsDefects(idx).BoundingBox);
     set(h,'EdgeColor',[1 0 0]);
     hold on;
 end
 
figure;
subplot(2,5,1);
imshow(image)
title('Original Image');

subplot(2,5,2);
imshow(re_image)
title('Reduced Haze Image');

subplot(2,5,3);
imshow(sh_image)
title('Sharpened Image'); 
 
subplot(2,5,4);
imshow(stretched_image)
title('Contrast Stretch');

% subplot(2,5,5);
% imshow(hist_image)
% title('Histogram Equalised');

subplot(2,5,6);
imshow(g_image)
title('Grayscale');

subplot(2,5,7);
imshow(bin_image)
title('Binary');

subplot(2,5,8);
imshow(neg_image)
title('Complementary');

subplot(2,5,9);
imshow(bw_image)
title('Small objects Removed');

subplot(2,5,10);
imshow(fill_image)
title('Filled objects');
