image = imread('Pics2\cup2.jpeg');
imtool(image);
%%
subplot(221)
imhist(image(:,:,1))
title('Histogram of the Red band')
%%
stretched_image = imadjust(image,stretchlim(image));
subplot(222)
imshow(stretched_image)
title('Image Composite after Contrast Stretch')

figure
imhist(stretched_image(:,:,1))
title('Histogram of the Red band after Contrast Stretch')
%%
decorrstretched_image = decorrstretch(image,'Tol',0.01);
figure
imshow(decorrstretched_image);
title('Image Composite after Decorrelation Stretch')
%%
Igray = rgb2gray(image);
imshow(image);
%%
Ithresh = imbinarize(image,0.725);
imshowpair(image,Ithresh,'montage');
