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

    otherwise
        error('Not supported')
end

imgbias = flip(dcmf(ixs{:}), 1);
imgdc = flip(biasmf(ixs{:}), 1);

d0 = 8; % [DN]
T0 = 273.15; % [K]
k = 8.6171e-5; % [eV/K]
fun_Eg = @(T) 1.11557 - 7.021e-4.*T^2/(1108 + T); % eV
fun_T = @(T) (T./T0).^(1.5).*exp(fun_Eg(T0)./(2*k*T0) - fun_Eg(T)./(2*k*T));

img_corr = d0 + (imgbias + imgdc*tExp) * fun_T(Temp);


end