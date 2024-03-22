%% Decode an IMG file into parameters, labels, browse image and image

clear
clc
close all

init

flag_plot = true;

imgfile_path = fullfile(img_path,'AMI_EE3_040819_00208_00030.IMG'); 
%imgfile_path = fullfile(img_path,'04-10-28\AMI_EE3_041028_00269_00005.IMG');
%imgfile_path = fullfile(img_path,'04-11-11\AMI_EE3_041111_00008_00040.IMG');
%imgfile_path = fullfile(img_path,'AMI_EE3_040118_00004_00400.IMG');

% img\AMI_EE3_040118_00004_00400.IMG % Moon 18/01/04
% img\AMI_EE3_040326_00034_00200.IMG % Vega
% img\AMI_EE3_040504_00013_00020.IMG % Moon 04/05/04
% img\04-10-28\AMI_EE3_041028_00273_00005.IMG % Moon 28/10/04

[label, bimg, img] = decode_IMG(imgfile_path, flag_plot);