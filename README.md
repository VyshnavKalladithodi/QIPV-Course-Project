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
~~7. Cotton Pieces ~~
~~8. Chewing gum ~~
~~9. Hair  ~~
10. Mask

## Deadline

> April 15 2021

## TASKS
- [x] Create a list of objects
- [x] Create/find a dataset containing the above mentioned situations
- [x] Find a Standard Algorithm
- [ ] Optimisation
- [ ] Testing
- [ ] Getting ready for live demonstration

## Progress
|  Author  |  Detailed Description |
|----------|  -------------------- |
|  Vyshnav K  | Tested a simple Algorithm using Edges. The results were fine, but its not applicable in all cases. This Algorithm can be extended under certain circumstances |
|  Vyshnav K  | An algortihm which classify objects, due to the property of curvature boundaries. Under test. Lot more optimisation required |
|  Vyshnav K  | Texture Segmentation using Gabor Filter. This algo segmentes certain patterns and textures in the image. We didnt get an expected output. But i think we could segment it by adding certain noise removel filters and correcting the image |
| Vismay Chand| The Code Image_Processing.m is able to detect objects with less accuracy using techniques such as Contrast Stretching, Histogram Equalisation, Decorrelation Stretch, Region properties with less accuracy. Further Refining and sequencing of the code is required. |
| Vismay Chand| The Code Testing_2.m is a much more simplified of the above code and has attained a much more accuracy in object detection, but the program detects wrong objects in the presence of external light effects and irregular background.
|  Sukesh J R  | All the images are uploaded |
| Vismay Chand | The Code "Working_3.m" is much more accurate than the previous code, but the shadow removing function is not implemented in this code as shadow removal causes the decraese in object's contrast which makes past detected images undetectable.Currently Ony Tissue Papers are only purely detectable |
| Vismay Chand | The cdoe "Testing_5.m" is improvised "working_3.m" with shadow removing function|
## Major Updates/Pointers

> Pls add any updates or important points concerned with the project

## References

> All resources are from Mathworks. If you find any other resources please mention it here

- Paper on Trash picking using deep learning:https://core.ac.uk/download/pdf/345094494.pdf
