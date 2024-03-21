%% DEFINES THE PATHS %%

user_name = 'andpi';

amiextractor_path = ['C:\Users\',user_name,'\OneDrive - Politecnico di Milano\03_PhD\06_Work\3_Radiometric Model\amiextractor'];
img_path = [amiextractor_path,'\data\img'];
mice_path =  ['C:\Users\',user_name,'\OneDrive\Documenti\MATLAB\mice'];
metakernel_path = [amiextractor_path,'\data'];

addpath(genpath(amiextractor_path));
addpath(genpath(mice_path));
