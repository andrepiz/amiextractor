function [params, bimg, img_raw, EC_raw] = extract_IMG(filepath_img, flag_plot, flag_correct_camera_spice, flag_use_state_metadata)
% Extract image and return metadata, browse image, raw image and electron count matrix
% flag_correct_camera_spice: 0 - keep data as given
%                            1 - correct focal length using res_px, muPixel and fov
%                            2 - correct pixel pitch using res_px, f and fov
% flag_use_state_metadata:   0 - use SPICE state
%                            1 - use metadata state

%% EXTRACT DATA FROM IMG
[label, bimg, img_raw] = decode_IMG(filepath_img, false);

label_temp = extractBetween(label, 'START_TIME         = ',' ');
params.etImg = cspice_str2et(label_temp{:});

label_temp = extractBetween(label, 'EXPOSURE_DURATION              = ',' <MS>');
params.tExp = 1e-3*str2double(label_temp{:});

label_temp = extractBetween(label, 'GAIN_NUMBER                    = ',' <E/DN>');
params.G_DA = str2double(label_temp{:});

label_temp = extractBetween(label, 'PHASE_ANGLE                    = ',' <DEG>');
params.phase_angle = deg2rad(str2double(label_temp{:}));

label_temp = extractBetween(label, 'FOCAL_PLANE_TEMPERATURE        = ',' <K>');
params.Temp = str2double(label_temp{:});

label_temp = extractBetween(label, 'SOLAR_DISTANCE                 = ',' <KM>');
d_sun2body_metadata = 1e3*(str2double(label_temp{:}));

label_temp = extractBetween(label, 'SC_TARGET_POSITION_VECTOR      = (',')');
pos_cam2body_J2000_metadata = 1e3*(str2double(strsplit(label_temp{:},',')))';
     
label_temp = extractBetween(label, 'FILE_NAME                      = "','"');
nfilter = str2double(label_temp{:}(7));

label_temp = extractBetween(label, 'DARK_CURRENT_CORRECTION_FLAG   = "','"');
try
    params.flag_dc_calibrated = boolean(strcmp(label_temp{:},'TRUE'));
catch
    params.flag_dc_calibrated = false;
end

label_temp = extractBetween(label, 'FLAT_FIELD_CORRECTION_FLAG     = "','"');
try
    params.flag_flatfield_calibrated = boolean(strcmp(label_temp{:},'TRUE'));
catch
    params.flag_flatfield_calibrated = false;
end

%% EXTRACT DATA FROM KERNELS

% Instrument name          ID
% --------------------   -------
% SMART1_AMIE_CCD        -238100
% 
% SMART1_AMIE_NONE       -238110
% SMART1_AMIE_LASER      -238120
% SMART1_AMIE_VIS_X      -238130
% SMART1_AMIE_VIS_Y      -238131
% SMART1_AMIE_FEL_X      -238140
% SMART1_AMIE_FEL_Y      -238141
% SMART1_AMIE_FEH_X      -238150
% SMART1_AMIE_FEH_Y      -238151

camera_id = '-238110'; % Using NONE filter camera.

% FOCAL_LENGTH
% F/RATIO
% FOV_ANGULAR_SIZE
% IFOV
% PIXEL_SIZE
% PIXEL_SAMPLES
% PIXEL_LINES
% CCD_CENTER
% FILTER_BANDCENTER
% FILTER_BANDWIDTH

params.f = 1e-3*cspice_gdpool(['INS',camera_id,'_','FOCAL_LENGTH'], 0, 1);
params.fNum = cspice_gdpool(['INS',camera_id,'_','F/RATIO'], 0, 1);
params.muPixel = 1e-6*cspice_gdpool(['INS',camera_id,'_','PIXEL_SIZE'], 0, 1);
params.res_px = cspice_gdpool(['INS',camera_id,'_','PIXEL_SAMPLES'], 0, 1);
params.fov = cspice_gdpool(['INS',camera_id,'_','FOV_ANGULAR_SIZE'], 0, 1); % not consistent
lambda_mid = 1e-9*cspice_gdpool(['INS',camera_id,'_','FILTER_BANDCENTER'], 0, 1);
lambda_band = 1e-9*cspice_gdpool(['INS',camera_id,'_','FILTER_BANDWIDTH'], 0, 1);
params.lambda_min = lambda_mid - lambda_band/2;
params.lambda_max = lambda_mid + lambda_band/2;
params.nfilter = nfilter;

switch flag_correct_camera_spice
    case 0
    case 1
        params.f = params.res_px.*params.muPixel/2 / tan(params.fov/2);        
    case 2
        params.muPixel = params.f*2./params.res_px.*tan(params.fov/2);
end

% REF: AMIE detector orientation in s/c coordinate system
pos_cam2body_J2000_spice = -1e3*cspice_spkpos('SMART-1', params.etImg, 'J2000', 'NONE', 'MOON');
if flag_use_state_metadata
    pos_cam2body_J2000 = pos_cam2body_J2000_metadata;
else
    pos_cam2body_J2000 = pos_cam2body_J2000_spice;
end
dir_cam2body_J2000 = vecnormalize(pos_cam2body_J2000);
d_cam2body = norm(pos_cam2body_J2000);

pos_sun2body_J2000_spice = -1e3*cspice_spkpos('SUN', params.etImg, 'J2000', 'NONE', 'MOON');
dir_sun2body_J2000_spice = vecnormalize(pos_sun2body_J2000_spice);
d_sun2body_spice = norm(pos_sun2body_J2000_spice);
if flag_use_state_metadata
    d_sun2body = d_sun2body_metadata;
else
    d_sun2body = d_sun2body_spice;
end

dcm_J20002CAM = cspice_pxform('J2000', 'SMART1_AMIE_NONE', params.etImg);
dcm_J20002IAU = cspice_pxform('J2000', 'IAU_MOON', params.etImg);

% CSF Frame
%   centered at the planet COM
%   z-axis cross vector between sun direction and camera direction
%   x-axis along sun direction
%   y-axis completes the frame
xCSF_J2000 = -dir_sun2body_J2000_spice;
zCSF_J2000 = vecnormalize(cross(-dir_sun2body_J2000_spice, -dir_cam2body_J2000));
yCSF_J2000 = vecnormalize(cross(zCSF_J2000, xCSF_J2000));
dcm_J20002CSF(1,1:3,:) = xCSF_J2000;
dcm_J20002CSF(2,1:3,:) = yCSF_J2000;
dcm_J20002CSF(3,1:3,:) = zCSF_J2000;
q_J20002CSF = dcm_to_quat(dcm_J20002CSF);

% CAMI Frame
%   centered at the S/C
%   z-axis along camera-to-body direction
%   y-axis opposite to z_CSF
%   x-axis completes the frame
yCAMI_J2000 = -zCSF_J2000;
zCAMI_J2000 = dir_cam2body_J2000;
xCAMI_J2000 = vecnormalize(cross(yCAMI_J2000, zCAMI_J2000));
dcm_J20002CAMI(1,1:3,:) = xCAMI_J2000;
dcm_J20002CAMI(2,1:3,:) = yCAMI_J2000;
dcm_J20002CAMI(3,1:3,:) = zCAMI_J2000;
q_J20002CAMI = dcm_to_quat(dcm_J20002CAMI);

% CAM frame
%   centered at the S/C
%   z-axis along optical axis
%   y-axis rotated accordingly to off-pointing
%   x-axis completes the frame
q_J20002CAM = dcm_to_quat(dcm_J20002CAM);

% International Astronomical Union (IAU) frame: 
%   centered at the planet COM
%   body-fixed frame, SPICE-consistent
q_J20002IAU = dcm_to_quat(dcm_J20002IAU);

params.q_CSF2IAU = quat_mult(quat_conj(q_J20002CSF), q_J20002IAU);
params.q_CAMI2CAM = quat_mult(quat_conj(q_J20002CAMI), q_J20002CAM);
params.d_body2cam = d_cam2body;
params.d_body2sun = d_sun2body;

% CORRECT MISSING PARAMETERS
if isnan(params.phase_angle)
    warning('Phase angle is missing in image metadata')
    params.phase_angle = acos(dot(-dir_cam2body_J2000, -dir_sun2body_J2000_spice));
end

% Compute errors
params.errpos_cam2body_J2000_metadata_spice = pos_cam2body_J2000_metadata - pos_cam2body_J2000_spice;
params.relerrpos_cam2body_J2000_metadata_spice = params.errpos_cam2body_J2000_metadata_spice./d_cam2body;
params.errd_cam2body_metadata_spice = vecnorm(pos_cam2body_J2000_metadata) - vecnorm(pos_cam2body_J2000_spice);
params.relerrd_cam2body_metadata_spice = params.errd_cam2body_metadata_spice./d_cam2body;
params.errd_sun2body_metadata_spice = d_sun2body_metadata - d_sun2body_spice;
params.relerrd_sun2body_metadata_spice = params.errd_sun2body_metadata_spice./d_sun2body;

%% ELECTRON COUNT
EC_raw = params.G_DA*img_raw;

%% PLOT

if flag_plot

    R_frames2ref(:,:,1) = dcm_J20002CSF';
    R_frames2ref(:,:,2) = dcm_J20002IAU';
    R_frames2ref(:,:,3) = dcm_J20002CAMI';
    R_frames2ref(:,:,4) = dcm_J20002CAM';
    R_pos_ref = 3*[zeros(3, 2), -dir_cam2body_J2000, -dir_cam2body_J2000];
    v_ref = 1.5*[-dir_sun2body_J2000_spice, -dir_cam2body_J2000];
    v_pos_ref = zeros(3, 2);
    fh  = figure(); grid on; hold on; axis equal
    plot_frames_and_vectors(R_frames2ref, R_pos_ref, v_ref, v_pos_ref,...
        fh,...
        {'CSF','IAU','CAMI','CAM'},{'Sun','SC'});

    res_px = 512;
    [x_pixel, y_pixel] = meshgrid([1:res_px], [1:res_px]);
    clims = [min(img_raw,[],'all'), max(img_raw,[],'all')];
    clims_ec = [min(EC_raw,[],'all'), max(EC_raw,[],'all')];

    figure()
    imshow(img_raw)
    colorbar
    clim(clims)
    title('Raw Image')
    xlim([1, size(img_raw, 1)])
    ylim([1, size(img_raw, 2)])
    xlabel('u [px]')
    ylabel('v [px]')
    
    figure()
    grid on, hold on
    surf(x_pixel, y_pixel, EC_raw, 'EdgeColor','none')
    set(gca,'YDir','reverse')
    colormap('parula')
    clim(clims_ec)
    colorbar
    xlabel('u [px]')
    ylabel('v [px]')
    title('Raw Electron Count');
    pbaspect([1, 1, 10])
    xlim([0 res_px])
    ylim([0 res_px])

end


end



                

                                       
