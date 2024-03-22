%% Check if moon projection is consistent with expected location

clear
clc
close all

init

imgfile_path = fullfile(img_path,'04-10-28\AMI_EE3_041028_00269_00005.IMG');

[params, label, bimg, img] = extract_IMG(imgfile_path, metakernel_path, false);

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
