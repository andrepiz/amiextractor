function [C, xCir, yCir] = check_geometry_IMG(img, params, flag_plot)
% Check if moon projection is consistent with expected location.
% Note: small differences are expected due to kernels uncertainties

K_c = [params.f/params.muPixel, 0, params.res_px/2 + 0.5; ...
       0 ,params.f/params.muPixel, params.res_px/2 + 0.5;...
       0 ,0, 1];
rMoon = 1737.4e3; %[km]

%Plot expected image center according to kernels
dir_cam2body_CAM = quat_to_dcm(params.q_CAMI2CAM)*[0;0;1];
uv_moon_center = K_c*dir_cam2body_CAM;
uv_moon_center_scaled = uv_moon_center(1:2)/uv_moon_center(3);

%Plot circle with Moon expected size
MoonAngSize = asin(rMoon/params.d_body2cam);
MoonRadPix = MoonAngSize/(params.fov/params.res_px);
angVecCir = deg2rad(0:1:360);
xCir = MoonRadPix*cos(angVecCir) + uv_moon_center_scaled(1);
yCir = MoonRadPix*sin(angVecCir) + uv_moon_center_scaled(2);
C = [xCir; yCir];

if flag_plot
    figure(); 
    imshow(img);
    clim([min(img,[],'all'), max(img,[],'all')])
    grid on, hold on
    plot(uv_moon_center_scaled(1), uv_moon_center_scaled(2), 'r+');
    plot(C(1,:), C(2,:));
    xlabel('u [px]')
    ylabel('v [px]')
end

end
