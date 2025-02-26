function [img_full, label, bimg, img, fh] = merge_IMG(filepath_img, flag_plot)
% Merge single-filter images into a single image

nfilter = 8;

filter_ids = 1:nfilter;

if contains(filepath_img, 'AMI_LR')
    imgfile_volume = 'AMI_LR';
elseif contains(filepath_img, 'AMI_LE')
    imgfile_volume = 'AMI_LE';
else
    error('Volume identifier not recognized')
end

imgfile_path_after = extractAfter(filepath_img, imgfile_volume);

% Description of the keyword RECORD_BYTES
% This keyword denotes the number of bytes in one record. 
% After discussing with the ESA PSA team it was decided that one record is 
% defined to correspond to one line in the main image. As one pixel is stored
% in 2 bytes, the value of this keyword is twice the number of pixels per row. 
% Depending on the filter, this number can vary, as described in Table 5

% Description of the keyword FILE_RECORDS
% This keyword gives the number of records in the complete file. The header 
% is defined such that its length will always be 20480 bytes (10 records for 
% the maximum size image). The browse image will always be 128 pixels by 128 
% pixels, i.e. 128 * 128 bytes. The total number of records in a file is the 
% sum of the label records (see 6.3.1.2.5), the browse image records and the 
% image records (number of image lines), and is described in Table 5

% Description of the keyword LABEL_RECORDS
% This keyword is required by PDS for attached labels and denotes the number
% of records in the label. The label has the fixed length of 20480 bytes. 
% The bytes per record are determined by the filter name, thus the number 
% of records for the label is a function of the filter, as can be seen in Table 5.

% record_bytes = [1024 1024 1024 1024 512 512 512 512]; % number of bytes in one record
% image_records = [256 256 512 256 256 512 512 512];
% bimage_records = [16 16 16 16 32 32 32 32];
% label_records = [20 20 20 20 40 40 40 40];
% file_records = image_records + bimage_records + label_records;

%%
for ix = 1:length(filter_ids)
    filepath_img_temp = [imgfile_volume,num2str(filter_ids(ix)),imgfile_path_after(2:end)];
    [label{ix}, bimg{ix}, img{ix}] = decode_IMG(filepath_img_temp, flag_plot);
end

%% MOSAIKING

for ix = 1:length(img)
    img_mat{ix} = flip(img{ix}, 1);
end

img_nw = [img_mat{1}; img_mat{2}]; 
img_ne = img_mat{3};
img4_large = zeros(512, 512);
img8_large = zeros(512, 512);
img4_large(1:512/2,:) = img_mat{4};
img8_large(:, 512/2 + 1:end) = img_mat{8};
img_sw = img4_large + img8_large;
img_sw(1:512/2,512/2+1:end) = img_sw(1:512/2,512/2+1:end)/2; % averaging the shared area
img_sw(512/2+1:end, 1:512/2) = img_mat{5};
img_se = [img_mat{6}, img_mat{7}];

img_full_mat = [img_nw, img_ne; img_sw, img_se];

img_full = flip(img_full_mat, 1);

if flag_plot
    %Plot image
    fh = figure(); 
    grid on, hold on
    imshow(img_full);
    clim([min(img_full,[],'all'), max(img_full,[],'all')])
    xlabel('u')
    ylabel('v')
else
    fh = [];
end

end

