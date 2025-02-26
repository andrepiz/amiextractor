function offset = mfbias2offset(nfilter, biasmf, Temp)
% Find DN offset from bias master frame and current sensor temperature

% flip around 1st dimension to align frames wrt ICD
biasmf = flip(biasmf, 1);
switch nfilter
    case 3
        ixs = {1:512, 513:1024};
    otherwise
        error('Filter not supported')
end

imgbias = flip(biasmf(ixs{:}), 1);

Ktemp = amie_thermal_noise_factor(Temp);

offset = imgbias*Ktemp;

end