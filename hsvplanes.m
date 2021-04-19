%% Read in table image file
A = imread('Pics2\nmask3.jpeg');
figure
imshow(A)


vig_image = imflatfield(A,25);

re_image = imreducehaze(vig_image);

sh_image = imsharpen(re_image,'Radius',1,'Amount',2);

stretched_image = imadjust(sh_image,stretchlim(re_image,[0.3 0.9]),[]);

%% HSV color space
H = rgb2hsv(stretched_image);
H_plane=H(:,:,1);
S_plane=H(:,:,2);
V_plane=H(:,:,3);
% figure;
subplot(2,2,1), imshow(H_plane);
title('H Plane');
subplot(2,2,2), imshow(S_plane);
title('S Plane');
subplot(2,2,3), imshow(V_plane);
title('V Plane');
subplot(2,2,4), imshow(A);
title('Original Image');

%% Threshold HSV color space (the noise particle appears here in the preview)
levelh = 0.1
levels = 0.15 %original 0.26
levelv = 0.2 %original is 0.2
i1 = im2bw(H_plane,levelh);
i2 = im2bw(S_plane,levels);
i3 = im2bw(V_plane,levelv);
isum = (i1&i2&i3);
subplot(2,2,1), imshow(i1);
title('Hue plane');
subplot(2,2,2), imshow(i2);
title('Saturation plane');
subplot(2,2,3), imshow(i3);
title('Value plane');
subplot(2,2,4), imshow(isum);
title('Combined plane');

%% Complement image and fill the holes
icomp = imcomplement(isum);
ifilled = imfill(icomp, 'holes');
figure, imshow(ifilled);

%% 
se = strel('disk', 25);
iopen = imopen(ifilled,se);
imshow(iopen);

%% remove noise
afterClosing = imclose(iopen,se);
imshow(afterClosing)

%% Extract features
Iregion = regionprops(iopen, 'centroid');
[labeled,numObjects] = bwlabel(iopen,4);
stats = regionprops(labeled,'Eccentricity','Area','BoundingBox');
areas = [stats.Area];
eccentricities = [stats.Eccentricity];

%% Use feature analysis to count skittles objects
idxOfSkittles = find(eccentricities);
statsDefects = stats(idxOfSkittles);
figure, imshow(A);
hold on;
for idx = 1 : length(idxOfSkittles)
        h = rectangle('Position',statsDefects(idx).BoundingBox,'LineWidth',2);
        set(h,'EdgeColor',[0 1 0]);
        hold on;
end
if idx >=1
title(['There are ', num2str(numObjects), ' objects in the image!']);
end
hold off;
