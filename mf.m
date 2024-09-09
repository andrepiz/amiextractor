%% Extract bias and dark current master frames

clear 
clc
close all

init

%% CALIBRATION TEST

flag_debug = false;

% Sky
imgskyfile_path = fullfile(img_path,'CALIB\AMI_LE3_R00976_00007_00500.IMG');
[imgsky_full, labelsky, bimgsky, imgsky] = merge_IMG(imgskyfile_path, flag_debug);

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


% Bias
mfbiasfile_path = fullfile(img_path,'CALIB\AMI_LMA_071101_00001_00000.IMG');
[labelbias, bmfbias, mfbias] = decode_IMG(mfbiasfile_path, false);

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
mfdcfile_path = fullfile(img_path,'CALIB\AMI_LMA_071101_00002_00001.IMG');
[labeldc, bmfdc, mfdc] = decode_IMG(mfdcfile_path, false);
mfdc = 1e3*mfdc; % must be brought to 1s
bmfdc = 1e3*bmfdc; % must be brought to 1s

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


%% PLOT
[XX, YY] = meshgrid(1:size(mfbias, 2), 1:size(mfbias, 1));

%%
mfbias_sat = max(min(mfbias, mfbias_max), mfbias_min);

c_lims = [mfbias_min, mfbias_max];
red_threshold = 20;
blue_threshold = 0;
c = colormap('gray');
vspan = linspace(c_lims(1), c_lims(2), 2^24);
gixs = vspan > blue_threshold & vspan < red_threshold;
rixs = vspan >= red_threshold;
bixs = vspan <= blue_threshold;
c(gixs,:) = interp1(linspace(min(vspan(gixs)), max(vspan(gixs)), size(c, 1)), c, vspan(gixs));
c(rixs,:) = repmat([1,0,0], sum(rixs),1);
c(bixs,:) = repmat([0,0,1], sum(bixs),1);

figure()
grid on, hold on
surf(XX, YY, mfbias_sat, 'EdgeColor','none');
set(gca,'YDir','reverse')
pbaspect([1,1,10])
colormap(c);
colorbar
clim(c_lims)
xlim([1 size(mfbias_sat, 1)]);
ylim([1 size(mfbias_sat, 2)]);
title('Bias Master Frame')

%%
mfdc_sat = max(min(mfdc, mfdc_max), mfdc_min);


c_lims = 1e3*[mfdc_min, mfdc_max];
red_threshold = 20;
blue_threshold = 0;
c = colormap('gray');
vspan = linspace(c_lims(1),c_lims(2), 2^24);
gixs = vspan > blue_threshold & vspan < red_threshold;
rixs = vspan >= red_threshold;
bixs = vspan <= blue_threshold;
c(gixs,:) = interp1(linspace(min(vspan(gixs)), max(vspan(gixs)), size(c, 1)), c, vspan(gixs));
c(rixs,:) = repmat([1,0,0], sum(rixs),1);
c(bixs,:) = repmat([0,0,1], sum(bixs),1);

figure()
grid on, hold on
surf(XX, YY, 1e3*mfdc_sat, 'EdgeColor','none');
set(gca,'YDir','reverse')
pbaspect([1,1,10])
colormap(c);
colorbar
clim(c_lims)
xlim([1 size(mfdc_sat, 1)]);
ylim([1 size(mfdc_sat, 2)]);
title('Dark Current Master Frame')

%% Apply Dark Current and Bias correction
d0 = 8; % [DN]
T0 = 273.15; % [K]
k = 8.6171e-5; % [eV/K]
fun_Eg = @(T) 1.11557 - 7.021e-4.*T^2/(1108 + T); % eV
fun_T = @(T) (T./T0).^(1.5).*exp(fun_Eg(T0)./(2*k*T0) - fun_Eg(T)./(2*k*T));

label_temp = extractBetween(labelsky{1}, 'FOCAL_PLANE_TEMPERATURE        = ',' <K>');
Temp = str2double(label_temp{:});

tExp = 500e-3;

Dcorr = d0 + (mfbias + mfdc*tExp) * fun_T(Temp);

imgsky_corr = imgsky_full - Dcorr;

figure('Units','normalized','Position',[0.1 0.2 0.8 0.7])
c0 = colormap('gray');

c_lims = [imgsky_min, imgsky_max];
c1_lims = [-20, imgsky_max];
red_threshold = 100;
blue_threshold = -20;
c1 = c0;
vspan = linspace(c1_lims(1),c1_lims(2), 2^24);
gixs = vspan > blue_threshold & vspan < red_threshold;
rixs = vspan >= red_threshold;
bixs = vspan <= blue_threshold;
c1(gixs,:) = interp1(linspace(min(vspan(gixs)), max(vspan(gixs)), size(c1, 1)), c1, vspan(gixs));
c1(rixs,:) = repmat([1,0,0], sum(rixs),1);
c1(bixs,:) = repmat([0,0,1], sum(bixs),1);

figure()
grid on, hold on
surf(XX, YY, imgsky_full, 'EdgeColor','none');
set(gca,'YDir','reverse')
pbaspect([1,1,10])
colormap(c1);
colorbar
clim(c1_lims)
xlim([1 size(imgsky_full, 1)]);
ylim([1 size(imgsky_full, 2)]);
title('Raw Image')

figure()
grid on, hold on
surf(XX, YY, Dcorr, 'EdgeColor','none');
set(gca,'YDir','reverse')
pbaspect([1,1,10])
%colormap('parula');
colormap(c1);
colorbar
clim(c1_lims)
%clim([min(Dmod,[],'all'), max(Dmod,[],'all')])
xlim([1 size(Dcorr, 1)]);
ylim([1 size(Dcorr, 2)]);
title('Correction Frame')

c2_lims = [-240, 750];
red_threshold = 100;
blue_threshold = -20;
c2 = c0;
vspan = linspace(c2_lims(1),c2_lims(2), 2^24);
gixs = vspan > blue_threshold & vspan < red_threshold;
rixs = vspan >= red_threshold;
bixs = vspan <= blue_threshold;
c2(gixs,:) = interp1(linspace(min(vspan(gixs)), max(vspan(gixs)), size(c2, 1)), c2, vspan(gixs));
c2(rixs,:) = repmat([1,0,0], sum(rixs),1);
c2(bixs,:) = repmat([0,0,1], sum(bixs),1);

figure()
grid on, hold on
surf(XX, YY, imgsky_corr, 'EdgeColor','none');
set(gca,'YDir','reverse')
pbaspect([1,1,10])
colormap(c2);
colorbar
clim(c2_lims)
%clim([min(Dcorr,[],'all'), max(Dcorr,[],'all')])
xlim([1 size(imgsky_corr, 1)]);
ylim([1 size(imgsky_corr, 2)]);
title('Corrected Image')

%% Histograms
nh = 250;

figure()
subplot(1,2,1)
histogram(imgsky_full(:), nh, 'Normalization','count')
xlim([0, 100])

nh = 1e3;
subplot(1,2,2)
histogram(imgsky_corr(:), nh, 'Normalization','count')
xlim([-10, 10])

%% Save Master Frames
save(fullfile(amiextractor_path, 'mf/mfbias.mat'),'mfbias')
save(fullfile(amiextractor_path, 'mf/mfdc.mat'),'mfdc')

