%% MAIN
clear
clc
close all

init()

flag_plot = true;

%% Choose image
imgfile_name = 'AMI_EE3_040819_00208_00030.IMG'; % Moon high phase angle
%imgfile_name = 'AMI_EE3_041028_00269_00005.IMG'; % Moon low phase angle far
%imgfile_name = 'AMI_EE3_041028_00101_00010.IMG'; % Moon high phase angle far
%imgfile_name = 'AMI_EE3_041111_00008_00040.IMG'; % Moon high phase angle close up
% imgfile_name = 'AMI_EE3_040326_00034_00200.IMG'; % Vega
imgfile_path = fullfile(img_path,imgfile_name);

%% Decode an IMG file into parameters, labels, browse image and image
[params, label, bimg, img] = extract_IMG(imgfile_path, metakernel_path, flag_plot);

%% Correct image with Bias and DC master frames
mfbias_path = 'mf\mfbias.mat';
mfdc_path = 'mf\mfdc.mat';
[img_raw, img_new] = correct_IMG(imgfile_path, metakernel_path, mfbias_path, mfdc_path, flag_plot);

%% Geometry check 
% Check if expected Moon location by spice kernels match the Moon position on the image
check_geometry_IMG(imgfile_path, metakernel_path, flag_plot);

%% Radiometry check 
% Check if browse image downloaded from database is the same of the original image linearly stretched
bimgfile_name = [imgfile_name(1:end-4), '.png'];
bimgfile_path = fullfile(img_path,'BROWSE',bimgfile_name); 

check_radiometry_IMG(img, bimgfile_path, flag_plot);