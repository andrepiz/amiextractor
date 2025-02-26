function [params, bimg, img_raw, img_new, EC_raw, EC_new, img_noise] = extract_and_correct_IMG(filepath_img, mfbias, mfdc, flag_plot, flag_correct_camera_spice, flag_use_state_metadata)
% Extract raw image, correct it with bias and dark current and return raw 
% and new image and electron count matrices
% flag_correct_camera_spice: 0 - keep data as given
%                            1 - correct focal length using res_px, muPixel and fov
%                            2 - correct pixel pitch using res_px, f and fov
% flag_use_state_metadata:   0 - use SPICE state
%                            1 - use metadata state

%% EXTRACT DATA FROM IMG
[params, bimg, img_raw, EC_raw] = extract_IMG(filepath_img, flag_plot, flag_correct_camera_spice, flag_use_state_metadata);

%% BIAS & DC CORRECTION
% Apply Bias and Dark Current master frames correction to an image, if not
% already done
[img_new, EC_new, img_noise] = correct_IMG(img_raw, params, mfbias, mfdc, flag_plot);

end



                

                                       
