
image = imread('Pictures\all.jpeg');

% br_image = imlocalbrighten(image,0.1);

vig_image = imflatfield(image,25);

re_image = imreducehaze(vig_image);

sh_image = imsharpen(re_image,'Radius',1,'Amount',0.5);

stretched_image = imadjust(sh_image,stretchlim(re_image,[0.3 0.9]),[]);

g_image = im2gray(stretched_image);

bin_image = g_image < 230;

neg_image = imcomplement(bin_image);

bw_image = bwareaopen(neg_image,2000);

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
subplot(2,6,1);
imshow(image)
title('Original Image');

% subplot(2,6,2);
% imshow(br_image)
% title('Bright Image');

subplot(2,6,3);
imshow(vig_image)
title('Shadow Removed');

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
imshow(g_image)
title('Grayscale');

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
