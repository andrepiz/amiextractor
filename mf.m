%% Extract bias and dark current master frames

clear 
clc
close all

init()

flag_plot_raw = false;
flag_plot = true;
scol = 2^20;

%% CALIBRATION TEST

% Sky
imgskyfile_path = fullfile(path_img,'CALIB\R00976\AMI_LE3_R00976_00007_00500.IMG');
[imgsky_full, labelsky, bimgsky, imgsky] = merge_IMG(imgskyfile_path, flag_plot_raw);

label_temp = extractAfter(labelsky{1}, 'OBJECT                         = IMAGE');
label_temp = extractBetween(label_temp, 'DERIVED_MINIMUM             = ','DERIVED_MAXIMUM');
label_temp = label_temp{:};
label_temp = label_temp(isstrprop(label_temp,'digit') | isstrprop(label_temp,'punct'));
imgsky_min = str2double(label_temp);

label_temp = extractAfter(labelsky{1}, 'OBJECT                         = IMAGE');
label_temp = extractBetween(label_temp, 'DERIVED_MAXIMUM             = ','FIRST_LINE');
label_temp = label_temp{:};
label_temp = label_temp(isstrprop(label_temp,'digit') | isstrprop(label_temp,'punct'));
imgsky_max = str2double(label_temp);

% Surface
imgsurffile_path = fullfile(path_img,'CALIB\R01845\AMI_LE3_R01845_00033_00030.IMG');
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

% Bias
mfbiasfile_path = fullfile(path_img,'CALIB\AMI_LMA_071101_00001_00000.IMG');
[labelbias, bmfbias, mfbias] = decode_IMG(mfbiasfile_path, flag_plot_raw);

label_temp = extractAfter(labelbias, 'OBJECT                         = IMAGE');
label_temp = extractBetween(label_temp, 'DERIVED_MINIMUM             = ','DERIVED_MAXIMUM');
label_temp = label_temp{:};
label_temp = label_temp(isstrprop(label_temp,'digit') | isstrprop(label_temp,'punct'));
mfbias_min = str2double(label_temp);

label_temp = extractAfter(labelbias, 'OBJECT                         = IMAGE');
label_temp = extractBetween(label_temp, 'DERIVED_MAXIMUM             = ','FIRST_LINE');
label_temp = label_temp{:};
label_temp = label_temp(isstrprop(label_temp,'digit') | isstrprop(label_temp,'punct'));
mfbias_max = str2double(label_temp);

% DC
mfdcfile_path = fullfile(path_img,'CALIB\AMI_LMA_071101_00002_00001.IMG');
[labeldc, bmfdc, mfdc] = decode_IMG(mfdcfile_path, flag_plot_raw);

label_temp = extractAfter(labeldc, 'OBJECT                         = IMAGE');
label_temp = extractBetween(label_temp, 'DERIVED_MINIMUM             = ','DERIVED_MAXIMUM');
label_temp = label_temp{:};
label_temp = label_temp(isstrprop(label_temp,'digit') | isstrprop(label_temp,'punct'));
mfdc_min = str2double(label_temp);

label_temp = extractAfter(labeldc, 'OBJECT                         = IMAGE');
label_temp = extractBetween(label_temp, 'DERIVED_MAXIMUM             = ','FIRST_LINE');
label_temp = label_temp{:};
label_temp = label_temp(isstrprop(label_temp,'digit') | isstrprop(label_temp,'punct'));
mfdc_max = str2double(label_temp);

% Master frames must be broought to 1s, and they are provided at 1 ms. So we 
% multiply for 1e3. 
mfdc = 1e3*mfdc; 
bmfdc = 1e3*bmfdc;

% % NOTE: there seems to be a scaling incosistency of additional 1e3 with the value 
% % shown in the CALIBRATION pdf plot for the DC frame. So we multiply for
% % 1e3 again both mf and limits
% mfdc = 1e3*mfdc;
% mfdc_max = 1e3*mfdc_max;
% mfdc_min = 1e3*mfdc_min;

%% PLOT
[XX, YY] = meshgrid(1:size(mfbias, 2), 1:size(mfbias, 1));
c0 = colormap('gray');

% Bias
mfbias_sat = max(min(mfbias, mfbias_max), mfbias_min);

c1 = c0;
c1_lims = [mfbias_min, mfbias_max];
red_threshold = 20;
blue_threshold = 0;
vspan = linspace(c1_lims(1), c1_lims(2), scol);
gixs = vspan > blue_threshold & vspan < red_threshold;
rixs = vspan >= red_threshold;
bixs = vspan <= blue_threshold;
c1(gixs,:) = interp1(linspace(min(vspan(gixs)), max(vspan(gixs)), size(c1, 1)), c1, vspan(gixs));
c1(rixs,:) = repmat([1,0,0], sum(rixs),1);
c1(bixs,:) = repmat([0,0,1], sum(bixs),1);

figure()
grid on, hold on
surf(XX, YY, mfbias_sat, 'EdgeColor','none');
set(gca,'YDir','reverse')
pbaspect([1,1,10])
colormap(c1);
colorbar()
clim(c1_lims)
xlim([1 size(mfbias_sat, 1)]);
ylim([1 size(mfbias_sat, 2)]);
title('Bias Master Frame')
hold off 

% Dark Current (PLOTTED FOR 1000 s!)
mfdc_sat = max(min(mfdc, mfdc_max), mfdc_min);

c2 = c0;
c2_lims = 1e3*[mfdc_min, mfdc_max];
red_threshold = 20;
blue_threshold = 0;
vspan = linspace(c2_lims(1),c2_lims(2), scol);
gixs = vspan > blue_threshold & vspan < red_threshold;
rixs = vspan >= red_threshold;
bixs = vspan <= blue_threshold;
c2(gixs,:) = interp1(linspace(min(vspan(gixs)), max(vspan(gixs)), size(c2, 1)), c2, vspan(gixs));
c2(rixs,:) = repmat([1,0,0], sum(rixs),1);
c2(bixs,:) = repmat([0,0,1], sum(bixs),1);

figure()
grid on, hold on
surf(XX, YY, 1e3*mfdc_sat, 'EdgeColor','none');
set(gca,'YDir','reverse')
pbaspect([1,1,10])
colormap(c2);
colorbar()
clim(c2_lims)
xlim([1 size(mfdc_sat, 1)]);
ylim([1 size(mfdc_sat, 2)]);
title('Dark Current Master Frame')
hold off

%% Apply Dark Current and Bias correction to Sky Image

label_temp = extractBetween(labelsky{1}, 'FOCAL_PLANE_TEMPERATURE        = ',' <K>');
Temp = str2double(label_temp{:});

tExp = 500e-3;

img_corr = mf2imgcorr('all', mfbias_sat, mfdc_sat, tExp, Temp);

imgsky_corr = imgsky_full - img_corr;

std(imgsky_corr(:))
median(imgsky_corr(:))

c3 = c0;
c3_lims = [-20, imgsky_max];
red_threshold = 100;
blue_threshold = -20;
vspan = linspace(c3_lims(1),c3_lims(2), scol);
gixs = vspan > blue_threshold & vspan < red_threshold;
rixs = vspan >= red_threshold;
bixs = vspan <= blue_threshold;
c3(gixs,:) = interp1(linspace(min(vspan(gixs)), max(vspan(gixs)), size(c3, 1)), c3, vspan(gixs));
c3(rixs,:) = repmat([1,0,0], sum(rixs),1);
c3(bixs,:) = repmat([0,0,1], sum(bixs),1);

figure()
grid on, hold on
surf(XX, YY, imgsky_full, 'EdgeColor','none');
set(gca,'YDir','reverse')
pbaspect([1,1,10])
colormap(c3);
colorbar
clim(c3_lims)
xlim([1 size(imgsky_full, 1)]);
ylim([1 size(imgsky_full, 2)]);
title('Raw Image')

figure()
grid on, hold on
surf(XX, YY, img_corr, 'EdgeColor','none');
set(gca,'YDir','reverse')
pbaspect([1,1,10])
%colormap('parula');
colormap('gray');
colorbar
clim(c3_lims)
clim([min(img_corr,[],'all'), max(img_corr,[],'all')])
xlim([1 size(img_corr, 1)]);
ylim([1 size(img_corr, 2)]);
title('Correction Frame')

c4 = c0;
c4_lims = [-240, 750];
red_threshold = 100;
blue_threshold = -20;
vspan = linspace(c4_lims(1),c4_lims(2), scol);
gixs = vspan > blue_threshold & vspan < red_threshold;
rixs = vspan >= red_threshold;
bixs = vspan <= blue_threshold;
c4(gixs,:) = interp1(linspace(min(vspan(gixs)), max(vspan(gixs)), size(c4, 1)), c4, vspan(gixs));
c4(rixs,:) = repmat([1,0,0], sum(rixs),1);
c4(bixs,:) = repmat([0,0,1], sum(bixs),1);

figure()
grid on, hold on
surf(XX, YY, imgsky_corr, 'EdgeColor','none');
set(gca,'YDir','reverse')
pbaspect([1,1,10])
colormap(c4);
colorbar
clim(c4_lims)
%clim([min(Dcorr,[],'all'), max(Dcorr,[],'all')])
xlim([1 size(imgsky_corr, 1)]);
ylim([1 size(imgsky_corr, 2)]);
title('Corrected Image')

% Histograms

nh = 1024;

figure()
subplot(1,3,1), grid on, hold on
histogram(imgsky_full(:), nh, 'Normalization','count')
xlim([-10, 100])

nh = 1024;
subplot(1,3,2), grid on, hold on
histogram(imgsky_corr(:), nh, 'Normalization','count')
xlim([-10, 100])

nh = 1024;
subplot(1,3,3), grid on, hold on
histogram(imgsky_corr(:), nh, 'Normalization','count')
xlim([-10, 10])

%% Apply Dark Current and Bias correction to Surface Image

label_temp = extractBetween(labelsurf{1}, 'FOCAL_PLANE_TEMPERATURE        = ',' <K>');
Temp = str2double(label_temp{:});

tExp = 30e-3;

img_corr = mf2imgcorr('all', mfbias_sat, mfdc_sat, tExp, Temp);

imgsurf_corr = imgsurf_full - img_corr;

figure('Units','normalized','Position',[0.1 0.2 0.8 0.7])

c5_lims = [0, 70];

subplot(1,2,1),
grid on, hold on, axis equal
imagesc(imgsurf_full)
set(gca,'YDir','reverse')
xlim([1 size(imgsurf_full, 1)]);
ylim([1 size(imgsurf_full, 2)]);
colormap('gray')
colorbar
title('Raw Image')
clim(c5_lims)
% subplot(1,3,2),
% grid on, hold on
% imagesc(Dcorr)

subplot(1,2,2),
grid on, hold on, axis equal
imagesc(imgsurf_corr)
set(gca,'YDir','reverse')
xlim([1 size(imgsurf_full, 1)]);
ylim([1 size(imgsurf_full, 2)]);
colormap('gray')
colorbar
title('Corrected Image')
clim(c5_lims)

%% Save Master Frames
save(fullfile(path_amiextractor, 'mf/mfbias.mat'),'mfbias')
save(fullfile(path_amiextractor, 'mf/mfdc.mat'),'mfdc')
save(fullfile(path_amiextractor, 'mf/mfbias_sat.mat'),'mfbias_sat')
save(fullfile(path_amiextractor, 'mf/mfdc_sat.mat'),'mfdc_sat')