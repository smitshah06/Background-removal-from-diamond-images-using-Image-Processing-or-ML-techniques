## MINeDHackathon
# Background removal from diamond images using Image Processing or ML techniques

# Dataset:
The dataset for the problem has been provided by D360 Tech. In the dataset, there are 14 folders - one for each SHAPE-label of a diamond.
There are a total of 9135 uniquely numbered diamonds each having 256 images captured at different angles.

# Datasets folder link:

https://drive.google.com/drive/folders/1FPiUhNzWmJMNXkafV02WDtCufWu83KUV?usp=sharing


It contains 3 .rar files:

      - Shape_1d_256i -> count  = 1 diamond of each SHAPE label
      
      - Shape_5d_256i -> count = {'PS': 5, 'RA': 5, 'PR': 5, 'EM': 5, 'BR': 5, 'MQ': 5, 'SEM': 2, 'OV': 5, 'HS': 5, 'CMB': 5, 'PE': 3, 'RD': 5, 'TRI': 1, 'AS': 5} 
      
      - Shape_10d_256i -> count = {'PS': 10, 'RA': 10, 'PR': 10, 'EM': 10, 'BR': 10, 'MQ': 10, 'SEM': 2, 'OV': 10, 'HS': 10, 'CMB': 10, 'PE': 3, 'RD': 10, 'TRI': 1, 'AS': 10}

# Image Processing:

Since images in the raw datasets do not have the output suitable to train the model first of all the required images have been created from the raw dataset using image processing techniques like power-law transformations, image smoothening, etc. using matlab. 

The code for the same has been provided in the MaskCreator.m file.

The images for AS type diamond after image processing have been uploaded in the release v1.0.1. These images include the desired target images which almost resemble the image of the diamond after removal of background. These images are used to train the model as the desired output to be achieved. A sample of this image is given below in the 3rd row and 1st column.

The primary task here is accomplished here but we always want a model to obtain faster results :).

# Methodology of Image processing:

1) The images were given a power-law transformation with c=1 and r=8.
2) The images were converted from RGB to grey scale and smoothened using gaussian filter.
3) The images were then passed to edge detection using sobel algorithm giving enough points on the outer surface to construct the mask.
4) The mask was then constructed using the convex hull algorithm.
5) The target image was generated using the multiplication operation between mask and the source image.

# Results after image processing:
![image](https://user-images.githubusercontent.com/72211869/156837029-c491a9a6-1a7b-4597-81ef-d440652e5524.png)

# All output images can be downloaded from https://drive.google.com/drive/folders/10xxhW00W0NxX-Hgs5K6ZOyfy1P3OCMI5?usp=sharing

# Model:

The model used to generate desired output images from input images is the Pix2Pix GAN for image translation with a reference to “[Image-to-Image Translation with Conditional Adversarial Networks](https://arxiv.org/abs/1611.07004)” and [presented at CVPR in 2017](https://ieeexplore.ieee.org/abstract/document/8100115), presented by [Philip Isola](http://web.mit.edu/phillipi/).

The Pix2Pix GAN has been demonstrated on a range of image-to-image translation tasks such as converting maps to satellite photographs, black and white photographs to color, and sketches of products to product photographs.

![image](https://user-images.githubusercontent.com/72211869/156833884-449959bd-85e6-4394-a2ec-19db81daeed6.png)

Reference: https://machinelearningmastery.com/how-to-develop-a-pix2pix-gan-for-image-to-image-translation

# Training:
The model presented here has been trained for only the type 'AS' diamond inputs from the Shape_5d_256i folder which includes about 1280 source images for 30 epochs.

The loss function used is binary_crossentropy and mae.

Training this model required around 3-3.5 hrs on GPU.

# Result(Produced by pix2pix GAN model trained on our dataset)

Input) -

Test image was taken from the 10d dataset(unseen image during training). Image name : - 6213507139_002.png

![image](https://user-images.githubusercontent.com/72211869/156853127-01b5af29-c63f-41de-9c20-58606f7f621a.png)

Output) -
(pyplot)

![image](https://user-images.githubusercontent.com/72211869/156853806-df11f4d5-8349-4d80-a88e-53dc78f8e7f9.png)

# Dependencies

The code requires libraries such as :
- numpy
- tensorflow
- keras
- matplotlib
- python 3

# How to use

- Load the model 'model_038400.h5' using the tenserflow api and directly predict an image. The code for predicting and loading can be found in the last execution cell of the Mined.ipynb file.
- Remember that the model uploaded to the repository only is trained for the AS diamond images.
- More types may be trained as per the requirement by the just changing the source and target images read by the model.
- Model can be downloaded from releases.
