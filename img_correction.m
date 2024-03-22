%% Apply Bias and Dark Current master frames correction to an image

clear
clc
close all

init

%% Load Master frames
try
    load('mf\mfbias.mat')
    load('mf\mfdc.mat')
catch
    mf_extract
end

%% Test a new single-filter image

%imgfile_path = fullfile(img_path,'04-10-28\AMI_EE3_041028_00269_00005.IMG');
%imgfile_path = fullfile(img_path,'04-11-11\AMI_EE3_041111_00008_00040.IMG');
%imgfile_path = fullfile(img_path, 'AMI_EE3_040118_00004_00400.IMG');
imgfile_path = fullfile(img_path,'AMI_EE3_040326_00034_00200.IMG');

% img\AMI_EE3_040118_00004_00400.IMG % Moon 18/01/04
% img\AMI_EE3_040326_00034_00200.IMG % Vega
% img\AMI_EE3_040504_00013_00020.IMG % Moon 04/05/04
% img\04-10-28\AMI_EE3_041028_00273_00005.IMG % Moon 28/10/04
[params, label, bimg_raw, img_raw] = extract_IMG(imgfile_path, metakernel_path, false);

% Clear kernel pool
cspice_kclear;

nfilter = 3;

label_temp = extractBetween(label, 'FOCAL_PLANE_TEMPERATURE        = ',' <K>');
Temp = str2double(label_temp{:});

label_temp = extractBetween(label, 'EXPOSURE_DURATION              = ',' <MS>');
tExp = 1e-3*str2double(label_temp{:});

img_corr = mf2imgcorr(nfilter, mfbias, mfdc, tExp, Temp);

img_new = img_raw - img_corr;

img_new(img_new<0) = 0;

clims = [min(img_raw,[],'all'), max(img_raw,[],'all')];

figure()
subplot(1,3,1)
imshow(img_raw)
colorbar
clim(clims)
title('Raw Image')
xlim([1, size(img_raw, 1)])
ylim([1, size(img_raw, 2)])
xlabel('u [px]')
ylabel('v [px]')

subplot(1,3,2)
imshow(img_corr)
colorbar
clim(clims)
title('Correction Image')
xlim([1, size(img_corr, 1)])
ylim([1, size(img_corr, 2)])
xlabel('u [px]')
ylabel('v [px]')

subplot(1,3,3)
imshow(img_new)
colorbar
clim(clims)
title('Image after correction')
xlim([1, size(img_new, 1)])
ylim([1, size(img_new, 2)])
xlabel('u [px]')
ylabel('v [px]')

%% ELECTRON COUNT

label_temp = extractBetween(label, 'GAIN_NUMBER                    = ',' <E/DN>');
G_DA = str2double(label_temp{:});

IMG_EC_raw = G_DA*img_raw;
IMG_EC_new = G_DA*img_new;

res_px = 512;
[x_pixel, y_pixel] = meshgrid([1:res_px], [1:res_px]);

figure()
grid on, hold on
surf(x_pixel, y_pixel, IMG_EC_new, 'EdgeColor','none')
set(gca,'YDir','reverse')
colormap('parula')
colorbar
xlabel('u [px]')
ylabel('v [px]')
title('Electron Count');
pbaspect([1, 1, 10])
xlim([0 res_px])
ylim([0 res_px])


                                        
