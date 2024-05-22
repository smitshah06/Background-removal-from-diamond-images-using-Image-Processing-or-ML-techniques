   % Save all images name in a  sequence manner before doing the operation 
   % names for example im1,im2,im3...
   %Save the folder of images in the current directory
   path_directory='C:\Users\Param\Desktop\Param\MINeDHackathon\Shape_5d_256i\Shape_5d_256i\AS'; % 'Folder name'
   original_files=dir([path_directory '/*.png']);
   ImageFolder ='C:\Users\Param\Desktop\Param\MINeDHackathon\Odoutput\BR_output';
   for k=1:length(original_files)
      filename=[path_directory '/' original_files(k).name];
      i=imread(filename);
      x=i;
      x=im2double(x);
      x=x.^8;
      x=rgb2gray(x);
      x=imgaussfilt(x,[2 2]);
      x=edge(x,"sobel");
      x=bwconvhull(x);
      i=im2double(i);
      result = i .* cat(3, x, x, x);
      file_name = sprintf('Image%04d.png', k);% name Image with a sequence of number, ex Image1.png , Image2.png....
      fullFileName = fullfile(ImageFolder, file_name);
      imwrite(result,file_name,'png') %save the image as a Portable Graphics Format file(png)into the MatLab
  end