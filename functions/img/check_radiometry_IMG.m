function bimg_stretched = check_radiometry_IMG(img, bimg, flag_plot)
% To check correct extraction, browse images are available at:
% https://archives.esac.esa.int/psa/ftp/SMALL-MISSIONS-FOR-ADVANCED-RESEARCH-AND-TECHNOLOGY/AMIE/S1-L-X-AMIE-2-EDR-EEP-V1.1/BROWSE/...
% Both versions have the same resolution, but while the original images in PDS format have 10 bit
% pixel depth, the PNG images have only 8 bit. They are linearly stretched so 
% that white is one standard deviation above the mean brightness and
% black is one standard deviation below (but not below zero). 
% Mean and standard deviation are computed ignoring saturated pixels.

img_sat = min(img, 2^10-1);
m = mean(img_sat(img_sat~=2^10-1),'all');
s = std(img_sat(img_sat~=2^10-1),[],'all');
w = min(2^10-1, m + s);
b = max(0, m - s);
bimg_stretched = uint8((img - b)/(w - b)*255);

if flag_plot
    figure()
    subplot(1,2,1)
    imshow(bimg)
    title('Browse image downloaded from database')
    subplot(1,2,2)
    imshow(bimg_stretched)
    title('Original image linearly stretched to 8-bit')
    sgtitle('Comparison of browse images')
end

end