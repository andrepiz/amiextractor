function [ds, dsnu, ds_mean, dsnu_mean] = mfdc2ds(nfilter, dcmf, Temp, G_DA)
% Find Dark Signal Mean [e-/s] and Non-Uniformity [%] from DC master frame, 
% digital-to-analog gain and current sensor temperature 
% Note: the Dark Current master frame must be provided for a 1s exposure
% time!

% flip around 1st dimension to align frames wrt ICD
dcmf = flip(dcmf, 1);
switch nfilter
    case 3
        ixs = {1:512, 513:1024};
    otherwise
        error('Filter not supported')
end

imgdc = flip(dcmf(ixs{:}), 1);
Ktemp = amie_thermal_noise_factor(Temp);

ds = imgdc*Ktemp*G_DA;

ds_mean = median(ds(:));

dsnu = ds./ds_mean - 1;

dsnu_mean = std(dsnu(:));

end


