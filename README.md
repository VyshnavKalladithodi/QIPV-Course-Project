# QIPV-Course-Project
An Image Processing Algorithm in MATLAB to detect plastic litter laying around the floor 

## AIM
An Image Processing Algorithm in MATLAB to:-
* Detemine certain objects in toilet background
* Input: Any image of toilet littered with certain objects
* Output: Draw a rectangle over the object and classify it as waste objects

## Pre-Requisites
1. MATLAB
2. Image Processing Toolbox
3. Computer Vision Toolbox
4. Statistical and Machine Learning Toolbox(Optional)
5. Deep Learning Toolbox(Optional)

## Data Set images
1. Tissue Paper
2. Paper Cup
3. Toffee Wrappers
4. Soap covers/boxes
5. Newspaper
6. Torn Cloth pieces
7. Mask

## Deadline

> April 15 2021

## TASKS
- [x] Create a list of objects
- [x] Create/find a dataset containing the above mentioned situations
- [x] Find a Standard Algorithm
- [x] Optimisation
- [x] Testing
- [x] Getting ready for live demonstration

## Progress
|  Author  |  Detailed Description |
|----------|  -------------------- |
|  Vyshnav K  | 'edgeDetection.m' is a simple algorithm for edge detection of objects. The results were fine only for a few images. The main obstacle in Edge detection algorithm was the removal of noise. Since the images are taken in toilet background, there would be other distinct features like tiles etc... So by this code we were not able to specifically indentify the waste materials. |
|  Vyshnav K  | 'curvature.m' is an algortihm which classify objects, due to the property of curvature boundaries. Since the objects of our interest include trash which are either crumbled or crushed, the assumptions was supposed to work. On testing this from our dataset, it didnt give expected results. The issue we faced was the disorderd high-low brigthness in the image. Due to certain region of high brightness in the images, it formed nebula shaped structure which was detected as trash by the program |
|  Vyshnav K  | 'textureGabourFIlter' implements the famous Texture Segmentation using Gabor Filter. This algo segmentes certain patterns and textures in the image. Upon testing we didnt get an expected output. The unwanted noise and disordered intensity in the image, where destroying the actual texture from the image. We have to work more on Color correction, Image Enhancement and Noise Removal to optimise it. |
| Vismay Chand| The Code Image_Processing.m is able to detect objects with less accuracy using techniques such as Contrast Stretching, Histogram Equalisation, Decorrelation Stretch, Region properties with less accuracy. Further Refining and sequencing of the code is required. |
| Vismay Chand| The Code Testing_2.m is a much more simplified of the above code and has attained a much more accuracy in object detection, but the program detects wrong objects in the presence of external light effects and irregular background.
|  Sukesh J R  |Initial Data Set Created with tissues, toffee wrapers, etc|
| Joseph M | Additional data sets created with tissues, bottles , soap bars and empty handwash container |
| Vismay Chand | The Code "Working_3.m" is much more accurate than the previous code, but the shadow removing function is not implemented in this code as shadow removal causes the decraese in object's contrast which makes past detected images undetectable.Currently Ony Tissue Papers are only purely detectable |
|  Sukesh J R  | Checked the color correction algorithm but did not work properly as it filters out more all green and red but takes blue lines from both image and background and detects both the image and bacground with testing_3.m|
| Joseph M | Data set with more contrasting black background created |
| Vismay Chand | The Code "Testing_5.m" is improvised "working_3.m" with shadow removing function|
|           | 'decorrelation.m' De-Correlation Stretch is a visual Enhancement to the image. Upon testing this method only gave results to a few cases |
|           | 'colourSegmentation.m' This is a reference code from Math Works which segments RGB color planes for feature extraction. Upon testing in the datset, it gave few expected output. The issue we faced was the noise and intensity of the image|
|  Sukesh J R  | Final Data Set Created with more data with paper cups and masks in various angles|
| Vyshnav K | 'hsvplane.m' This code segments colour plane, similar to the previous code, but segments HSV Planes. This algorithm gave great outputs. But we had to tweak the hsv levels for each image to get proper output.|
| Vismay Chand | The Code "Testing_10.m" has used the extraction of the Blue plane out of the image as majority of the object's colour lies in the blue region of the spectrum (This code works perfectly for the detecting the mask) |
| Vismay Chand | This code can be considered as the final code from me |
## Major Updates/Pointers

> Pls add any updates or important points concerned with the project

20-April-2021
The Testing_11.m Algorithm developed by @VismayChand gave a very good result in more than 18 images from the dataset :partying_face::partying_face:. 

## References

> All resources are from Mathworks. If you find any other resources please mention it here

- Paper on Trash picking using deep learning:https://core.ac.uk/download/pdf/345094494.pdf
- Feature Extraction Techniques:https://ijarcce.com/upload/2017/si/ICACTRP-17/IJARCCE-ICACTRP%2029.pdf
- Feature Extraction:https://ieeexplore.ieee.org/document/6783417
- Feature Extraction:http://www.ijsrp.org/research-paper-0416/ijsrp-p5250.pdf
