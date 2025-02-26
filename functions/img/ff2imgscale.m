function img_scale = ff2imgscale(nfilter, ffimg, tExp)
% Convert flat field into scaling image given the filter number, the
% exposure time

% master frames must be provided in image format (rows are u, columns are v)

% flip around 1st dimension to align frames wrt ICD
ffimg = flip(ffimg, 1);

switch nfilter
    case 3
        ixs = {1:512, 513:1024};
        
    otherwise
        error('Not supported')
end

ffimg = flip(ffimg(ixs{:}), 1);

img_scale = ffimg * tExp;


end