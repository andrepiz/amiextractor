%% Decode an IMG file into parameters, labels, browse image and image

clear
clc
close all

init

%% Load data and reconstruct image
imgfile_path = fullfile(img_path,'04-10-28\AMI_EE3_041028_00269_00005.IMG');
%imgfile_path = fullfile(img_path,'04-11-11\AMI_EE3_041111_00008_00040.IMG');
%imgfile_path = fullfile(img_path,'AMI_EE3_040118_00004_00400.IMG');

% img\AMI_EE3_040118_00004_00400.IMG % Moon 18/01/04
% img\AMI_EE3_040326_00034_00200.IMG % Vega
% img\AMI_EE3_040504_00013_00020.IMG % Moon 04/05/04
% img\04-10-28\AMI_EE3_041028_00273_00005.IMG % Moon 28/10/04

[params, label, bimg, img] = extract_data_smart1(imgfile_path, metakernel_path, false);

% Clear kernel pool
cspice_kclear;

% Computed expected Moon location and size from kernels
K_c = [params.f/params.muPixel, 0, params.res_px/2 + 0.5; ...
       0 ,params.f/params.muPixel, params.res_px/2 + 0.5;...
       0 ,0, 1];
rMoon = 1737.4e3; %[km]
IFOV = 0.000090; %[rad/px]

%Plot expected image center according to kernels
dir_cam2body_CAM = quat_to_dcm(params.q_CAMI2CAM)*[0;0;1];
uv_moon_center = K_c*dir_cam2body_CAM;
uv_moon_center_scaled = uv_moon_center(1:2)/uv_moon_center(3);

%Plot circle with Moon expected size
MoonAngSize = atan(rMoon/params.d_body2cam);
MoonRadPix = MoonAngSize/(params.fov/params.res_px);
angVecCir = deg2rad(0:1:360);
xCir = MoonRadPix*cos(angVecCir) + uv_moon_center_scaled(1);
yCir = MoonRadPix*sin(angVecCir) + uv_moon_center_scaled(2);
C = [xCir; yCir];

figure(); 
imshow(flip(img,1));
clim([min(img,[],'all'), max(img,[],'all')])
grid on, hold on
plot(uv_moon_center_scaled(1), uv_moon_center_scaled(2), 'r+');
plot(C(1,:), C(2,:));
xlabel('u [px]')
ylabel('v [px]')
