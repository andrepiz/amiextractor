function img_processed = flatfield_IMG(img_raw, params, mfff, flag_plot)
% Apply flat fielding to an image

%% FLAT FIELDING

img_scale = ff2imgscale(params.nfilter, mfff, params.tExp);
img_processed = img_raw .* img_scale;

if flag_plot

    clims = [min(img_raw,[],'all'), max(img_raw,[],'all')];
    clims_proc = median(img_processed,'all') + 3*std(img_processed,[],'all')*[-1, 1];

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
    title('Processed Image')
    xlim([1, size(img_new, 1)])
    ylim([1, size(img_new, 2)])
    xlabel('u [px]')
    ylabel('v [px]')

    figure()
    imshow(img_scale)
    colormap('turbo')
    colorbar
    clim(clims_proc)
    title('Scaling Image')
    xlim([1, size(img_corr, 1)])
    ylim([1, size(img_corr, 2)])
    xlabel('u [px]')
    ylabel('v [px]')
end

end




                                        
