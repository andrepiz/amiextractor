%% DEFINES THE PATHS %%

user_name = 'USER_NAME';

amiextractor_path = ['C:\Users\',user_name,'\PATH_TO_AMIEXTRACTOR'];
img_path = [amiextractor_path,'\data\img'];
mice_path =  ['C:\Users\',user_name,'\PATH_TO_MICE'];
metakernel_path = [amiextractor_path,'\data'];

addpath(genpath(amiextractor_path));
addpath(genpath(mice_path));
