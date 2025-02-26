function K = amie_thermal_noise_factor(Temp)

T0 = 273.15; % [K]
k = 8.6171e-5; % [eV/K]
fun_Eg = @(T) 1.11557 - 7.021e-4.*T.^2./(1108 + T); % eV
fun_T = @(T) (T./T0).^(1.5).*exp(fun_Eg(T0)./(2*k.*T0) - fun_Eg(T)./(2*k.*T));
K = fun_T(Temp);

end

