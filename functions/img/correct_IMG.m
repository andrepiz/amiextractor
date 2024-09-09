function [img_raw, img_new, EC_raw, EC_new] = correct_IMG(imgfile_path, metakernel_path, mfbias_path, mfdc_path, flag_plot)
% Apply Bias and Dark Current master frames correction to an image

%% LOAD DATA

% Image
[params, label, bimg_raw, img_raw] = extract_IMG(imgfile_path, metakernel_path, false);

% Parameters
label_temp = extractBetween(label, 'FOCAL_PLANE_TEMPERATURE        = ',' <K>');
Temp = str2double(label_temp{:});
label_temp = extractBetween(label, 'EXPOSURE_DURATION              = ',' <MS>');
tExp = 1e-3*str2double(label_temp{:});
label_temp = extractBetween(label, 'GAIN_NUMBER                    = ',' <E/DN>');
G_DA = str2double(label_temp{:});

% Master frames
load(mfbias_path)
load(mfdc_path)

%% CORRECTION
% Clear kernel pool
cspice_kclear;

% IMAGE CORRECTION
nfilter = 3;
img_corr = mf2imgcorr(nfilter, mfbias, mfdc, tExp, Temp);
img_new = img_raw - img_corr;
img_new(img_new<0) = 0;

% ELECTRON COUNT
EC_raw = G_DA*img_raw;
EC_new = G_DA*img_new;

if flag_plot

    res_px = 512;
    [x_pixel, y_pixel] = meshgrid([1:res_px], [1:res_px]);
    clims = [min(img_raw,[],'all'), max(img_raw,[],'all')];
    clims_corr = median(img_corr,'all') + 3*std(img_corr,[],'all')*[-1, 1];

    figure()
    subplot(1,2,1)
    imshow(img_raw)
    colorbar
    clim(clims)
    title('Raw Image')
    xlim([1, size(img_raw, 1)])
    ylim([1, size(img_raw, 2)])
    xlabel('u [px]')
    ylabel('v [px]')
    
    subplot(1,2,2)
    imshow(img_new)
    colorbar
    clim(clims)
    title('Corrected Image')
    xlim([1, size(img_new, 1)])
    ylim([1, size(img_new, 2)])
    xlabel('u [px]')
    ylabel('v [px]')
    
    figure()
    subplot(1,2,1)
    grid on, hold on
    surf(x_pixel, y_pixel, EC_raw, 'EdgeColor','none')
    set(gca,'YDir','reverse')
    colormap('parula')
    colorbar
    xlabel('u [px]')
    ylabel('v [px]')
    title('Raw Electron Count');
    pbaspect([1, 1, 10])
    xlim([0 res_px])
    ylim([0 res_px])
    
    subplot(1,2,2)
    grid on, hold on
    surf(x_pixel, y_pixel, EC_new, 'EdgeColor','none')
    set(gca,'YDir','reverse')
    colormap('parula')
    colorbar
    xlabel('u [px]')
    ylabel('v [px]')
    title('Corrected Electron Count');
    pbaspect([1, 1, 10])
    xlim([0 res_px])
    ylim([0 res_px])

    figure()
    imshow(img_corr)
    colormap('turbo')
    colorbar
    clim(clims_corr)
    title('Correction Image')
    xlim([1, size(img_corr, 1)])
    ylim([1, size(img_corr, 2)])
    xlabel('u [px]')
    ylabel('v [px]')
end

end




                                        
