%% MAIN
clear
clc
close all

init()

flag_plot = true;
flag_correct_camera_spice = 0;  % 0 - keep data as given
                                % 1 - correct focal length using res_px, muPixel and fov
                                % 2 - correct pixel pitch using res_px, f and fov
flag_use_state_metadata = 0;    % 0 - use SPICE state
                                % 1 - use metadata state

%% Choose image
filename_img = 'AMI_EE3_040819_00208_00030.IMG'; % Moon high phase angle
%filename_img = 'AMI_EE3_041028_00269_00005.IMG'; % Moon low phase angle far
%filename_img = 'AMI_EE3_041028_00101_00010.IMG'; % Moon high phase angle far
%filename_img = 'AMI_EE3_041111_00008_00040.IMG'; % Moon high phase angle close up
% filename_img = 'AMI_EE3_040326_00034_00200.IMG'; % Vega
filepath_img = fullfile(path_img, filename_img);

%% Define path of master frames 
path_mfbias = 'mf\mfbias.mat';
path_mfdc = 'mf\mfdc.mat';

%% Load SPICE Kernels
path_current = pwd;
cd(fileparts(filepath_metakernel))
cspice_furnsh(filepath_metakernel);
cd(path_current)

%% Decode an IMG file into parameters, labels, browse image and image
[params, bimg, img_raw] = extract_IMG(filepath_img, flag_plot, flag_correct_camera_spice, flag_use_state_metadata);

%% Correct image with Bias and DC master frames
mfbias = load(path_mfbias).mfbias;
mfdc = load(path_mfdc).mfdc;
img_new = correct_IMG(img_raw, params, mfbias, mfdc, flag_plot);

%% Geometry check 
% Check if expected Moon location by spice kernels match the Moon position on the image
check_geometry_IMG(img_raw, params, flag_plot);

%% Radiometry check 
% Check if browse image downloaded from database is the same of the original image linearly stretched
filename_bimg_download = [filename_img(1:end-4), '.png'];
filepath_bimg_download = fullfile(path_img,'BROWSE',filename_bimg_download); 
bimg_download = imread(filepath_bimg_download);

check_radiometry_IMG(img_raw, bimg_download, flag_plot);

%% Clear SPICE kernel pool
cspice_kclear;