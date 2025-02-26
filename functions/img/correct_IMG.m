function [img_new, EC_new, img_corr] = correct_IMG(img_raw, params, mfbias, mfdc, flag_plot)
% Apply Bias and Dark Current master frames correction to an image

%% CORRECTION

% IMAGE CORRECTION
img_corr = mf2imgcorr(params.nfilter, mfbias, mfdc, params.tExp, params.Temp);
img_new = img_raw - img_corr;
img_new(img_new<0) = 0;

% ELECTRON COUNT
EC_raw = params.G_DA*img_raw;
EC_new = params.G_DA*img_new;

if flag_plot

    res_px = 512;
    [x_pixel, y_pixel] = meshgrid([1:res_px], [1:res_px]);
    clims = [min(img_raw,[],'all'), max(img_raw,[],'all')];
    clims_ec = [min(EC_raw,[],'all'), max(EC_raw,[],'all')];
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
    clim(clims_ec)
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
    clim(clims_ec)
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




                                        
