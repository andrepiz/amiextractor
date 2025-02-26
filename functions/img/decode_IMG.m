function [label, bimg, img, fh] = decode_IMG(filepath, flag_plot)

% Please note that the EAICD requires a few updates:
% 
% *  In  older  versions  of  the  data product labels, the keyword SAM-
%    PLE_BIT_MASK was used with the intension to scale the  data  number
%    as  described in the EAICD. This was based on a wrong understanding
%    of SAMPLE_BIT_MASK. Now the keyword SCALING_FACTOR is used instead,
%    which  is not yet documented in the EAICD. However, the application
%    is straight forward: The value provided in  the  data  product  has
%    just  to be multiplied by the SCALING_FACTOR to obtain the original
%    data number.  This is only applicable for the  raw  data;  for  the
%    calibrated data, we always have SCALING_FACTOR = 1.
% 
% *  It  is  important  to  note  that additional geometrical parameters
%    (beyond those provided in the data product labels) can be found  in
%    the  `GEO_MOON'  index tabel in the `INDEX' directory.  This should
%    prominently be advertised in the EAICD.

fid = fopen(filepath); 
try
    fdata = fread(fid);
    fclose(fid);
catch
    fid
end

%--- Label
labelData = fdata(1:20481)';
label = char(labelData);

label_temp = extractBetween(label, 'RECORD_BYTES                   = ','FILE_RECORDS');
label_temp = label_temp{:};
label_temp = label_temp(isstrprop(label_temp,'digit'));
record_bytes = str2double(label_temp);

label_temp = extractBetween(label, 'LABEL_RECORDS                  = ','INTERCHANGE_FORMAT');
label_temp = label_temp{:};
label_temp = label_temp(isstrprop(label_temp,'digit'));
label_records = str2double(label_temp);

label_temp = extractAfter(label, 'OBJECT                         = BROWSE_IMAGE');
label_temp = extractBetween(label_temp, 'LINES                       = ','LINE_SAMPLES');
label_temp = label_temp{:};
label_temp = label_temp(isstrprop(label_temp,'digit'));
bimg_records = str2double(label_temp);

label_temp = extractAfter(label, 'OBJECT                         = BROWSE_IMAGE');
label_temp = extractBetween(label_temp, 'SAMPLE_BITS                 = ','SCALING_FACTOR');
label_temp = label_temp{:};
label_temp = label_temp(isstrprop(label_temp,'digit'));
bimg_nbits = str2double(label_temp);

label_temp = extractAfter(label, 'OBJECT                         = BROWSE_IMAGE');
label_temp = extractBetween(label_temp, 'SCALING_FACTOR              = ','END_OBJECT');
label_temp = label_temp{:};
label_temp = label_temp(isstrprop(label_temp,'digit') | isstrprop(label_temp,'punct'));
bimg_scaling = str2double(label_temp);

label_temp = extractAfter(label, 'OBJECT                         = BROWSE_IMAGE');
label_temp = extractBetween(label_temp, 'SAMPLE_TYPE                 = ','SAMPLE_BITS');
label_temp = label_temp{:};
bimg_format = strtrim(label_temp);

label_temp = extractAfter(label, 'OBJECT                         = IMAGE');
label_temp = extractBetween(label_temp, 'LINES                       = ','LINE_SAMPLES');
label_temp = label_temp{:};
label_temp = label_temp(isstrprop(label_temp,'digit'));
img_records = str2double(label_temp);

label_temp = extractAfter(label, 'OBJECT                         = IMAGE');
label_temp = extractBetween(label_temp, 'SAMPLE_BITS                 = ','SCALING_FACTOR');
label_temp = label_temp{:};
label_temp = label_temp(isstrprop(label_temp,'digit'));
img_nbits = str2double(label_temp);

label_temp = extractAfter(label, 'OBJECT                         = IMAGE');
label_temp = extractBetween(label_temp, 'SCALING_FACTOR              = ','END_OBJECT');
label_temp = label_temp{:};
label_temp = label_temp(isstrprop(label_temp,'digit') | isstrprop(label_temp,'punct'));
img_scaling = str2double(label_temp);

label_temp = extractAfter(label, 'OBJECT                         = IMAGE');
label_temp = extractBetween(label_temp, 'SAMPLE_TYPE                 = ','SAMPLE_BITS');
label_temp = label_temp{:};
img_format = strtrim(label_temp);
                         
        

% DELIMITERS
label_bimg_delimiter = record_bytes*label_records;
bimg_img_delimiter = label_bimg_delimiter + 128*bimg_records;
img_delimiter = bimg_img_delimiter + record_bytes*img_records;

%--- Browse Image
if strcmp(bimg_format, 'PC_REAL')
    flag_ibmformat = true;
else
    flag_ibmformat = false;
end
bimgData = fdata(label_bimg_delimiter + 1:bimg_img_delimiter);
bimg = bimg_scaling*bin2img(bimgData, bimg_records, bimg_nbits/8, flag_ibmformat);

%--- Image
if strcmp(img_format, 'PC_REAL')
    flag_ibmformat = true;
else
    flag_ibmformat = false;
end
imgData = fdata(bimg_img_delimiter + 1:img_delimiter);
img = img_scaling*bin2img(imgData, img_records, img_nbits/8, flag_ibmformat);

if flag_plot
    %Plot image
    fh = figure(); 
    imshow(img);
    clim([0, 2^10-1])
    colorbar
    %clim([min(img,[],'all'), max(img,[],'all')])
    xlabel('u [px]')
    ylabel('v [px]')
else
    fh = [];
end

end