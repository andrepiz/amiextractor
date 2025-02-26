function img_corr = mf2imgcorr(nfilter, biasmf, dcmf, tExp, Temp)
% Convert master frames into correction image given the filter number, the
% exposure time and the detector temperature

% master frames must be provided in image format (rows are u, columns are v)

% flip around 1st dimension to align frames wrt ICD
biasmf = flip(biasmf, 1);
dcmf = flip(dcmf, 1);

switch nfilter
    case 3
        ixs = {1:512, 513:1024};
        
    case 'all'
        ixs = {1:1024, 1:1024};
        
    otherwise
        error('Not supported')
end

imgbias = flip(biasmf(ixs{:}), 1);
imgdc = flip(dcmf(ixs{:}), 1);

d0 = 8; % [DN]
Ktemp = amie_thermal_noise_factor(Temp);

% It seems that multiplying d0 for Ktemp returns better image matching.
% Original equation in the docs:
% img_corr = d0 + (imgbias + imgdc*tExp) * Ktemp;
img_corr = d0*Ktemp + (imgbias + imgdc*tExp) * Ktemp;

end