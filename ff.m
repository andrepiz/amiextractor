%% Extract flat field frame

clear 
clc
close all

init()

flag_plot_raw = false;
flag_plot = true;
scol = 2^20;

%% FLAT FIELDING TEST

% Surface from Calibrated Volume
imgsurffile_path = fullfile(path_img,'CALIB\R01845\AMI_LR3_R01845_00033_00030.IMG');
[imgsurf_full, labelsurf, bimgsurf, imgsurf] = merge_IMG(imgsurffile_path, flag_plot_raw);

label_temp = extractAfter(labelsurf{1}, 'OBJECT                         = IMAGE');
label_temp = extractBetween(label_temp, 'DERIVED_MINIMUM             = ','DERIVED_MAXIMUM');
label_temp = label_temp{:};
label_temp = label_temp(isstrprop(label_temp,'digit') | isstrprop(label_temp,'punct'));
imgsurf_min = str2double(label_temp);

label_temp = extractAfter(labelsurf{1}, 'OBJECT                         = IMAGE');
label_temp = extractBetween(label_temp, 'DERIVED_MAXIMUM             = ','FIRST_LINE');
label_temp = label_temp{:};
label_temp = label_temp(isstrprop(label_temp,'digit') | isstrprop(label_temp,'punct'));
imgsurf_max = str2double(label_temp);

% Flat Field
fffile_path = fullfile(path_img,'CALIB\AMI_LMA_080319_00001_XXXXX.IMG');
[labelff, bffimg, ffimg] = decode_IMG(fffile_path, flag_plot_raw);

label_temp = extractAfter(labelff, 'OBJECT                         = IMAGE');
label_temp = extractBetween(label_temp, 'DERIVED_MINIMUM             = ','DERIVED_MAXIMUM');
label_temp = label_temp{:};
label_temp = label_temp(isstrprop(label_temp,'digit') | isstrprop(label_temp,'punct'));
ffimg_min = str2double(label_temp);

label_temp = extractAfter(labelff, 'OBJECT                         = IMAGE');
label_temp = extractBetween(label_temp, 'DERIVED_MAXIMUM             = ','FIRST_LINE');
label_temp = label_temp{:};
label_temp = label_temp(isstrprop(label_temp,'digit') | isstrprop(label_temp,'punct'));
ffimg_max = str2double(label_temp);

%% PLOT
[XX, YY] = meshgrid(1:size(ffimg, 2), 1:size(ffimg, 1));

c1_lims = [ffimg_min, ffimg_max];
c1_lims = [0. 0.05];
c1 = colormap('gray');

figure()
grid on, hold on
surf(XX, YY, ffimg, 'EdgeColor','none');
set(gca,'YDir','reverse')
pbaspect([1,1,10])
colormap(c1);
colorbar()
clim(c1_lims)
xlim([1 size(ffimg, 1)]);
ylim([1 size(ffimg, 2)]);
title('Flat Field Frame')
hold off 

%% Apply Flat Field scaling to Surf Image

label_temp = extractBetween(labelsurf{1}, 'FOCAL_PLANE_TEMPERATURE        = ',' <K>');
Temp = str2double(label_temp{:});

tExp = 30e-3;

% last pixel scaling. we know it is always be 1023
kscal = (2^10-1)./imgsurf_full(end, end);

Fscal = ffimg * tExp * kscal;

imgsurf_corr = imgsurf_full.*Fscal;

figure('Units','normalized','Position',[0.1 0.2 0.8 0.7])

%c2_lims = [0, 1024];

subplot(1,2,1),
grid on, hold on, axis equal
imagesc(imgsurf_full)
set(gca,'YDir','reverse')
xlim([1 size(imgsurf_full, 1)]);
ylim([1 size(imgsurf_full, 2)]);
colormap('gray')
colorbar
title('Raw Image')
%clim(c2_lims)

%c3_lims = [0, 1024];

subplot(1,2,2),
grid on, hold on, axis equal
imagesc(imgsurf_corr)
set(gca,'YDir','reverse')
xlim([1 size(imgsurf_full, 1)]);
ylim([1 size(imgsurf_full, 2)]);
colormap('gray')
colorbar
title('Unflat-fielded Image')
%clim(c3_lims)

%% Save Flat Field
save(fullfile(path_amiextractor, 'ff/ff.mat'),'ffimg')