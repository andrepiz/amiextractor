%% DEFINES THE PATHS %%

user_name = 'apizzetti';

path_amiextractor = ['C:\Users\',user_name,'\OneDrive - Politecnico di Milano\03_PhD\06_Work\abram\test\validation\amie\amiextractor'];
path_img = [path_amiextractor,'\data\img'];
path_mice =  ['C:\Users\',user_name,'\OneDrive\Documenti\MATLAB\mice'];
path_metakernel = fullfile(path_amiextractor,'data');
filepath_metakernel = fullfile(path_metakernel, 'metakernel.tm');

addpath(genpath(path_amiextractor));
addpath(genpath(path_mice));
