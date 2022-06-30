%% Extract the frequencies of the selected 
include;
clc; clear; close all; 

WITH_FEATURES = true;

% load directory containing wav files
wavdir = uigetdir(getenv("DIR_DATASET"), 'Location of wav files');
data_t = get_frequency_features(wavdir, WITH_FEATURES);

clc;

disp(data_t);

disp('=================================');
fprintf(['\nInstructions: \n   You could easily copy-paste \n' ...
    '   table data by selecting the ''data_t'' \n' ...
    '   variable in the workspace. \n\n']);
disp('=================================');
