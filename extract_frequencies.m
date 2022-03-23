%% Extract the frequencies of the selected 
include;
clc; clear; close all; 

% load directory containing wav files
wavdir = uigetdir(getenv("DIR_DATASET"), 'Location of wav files');
wavfiles = dir(fullfile(wavdir, '**/*.wav'));   % this includes subfolders

ndata = length(wavfiles);
for i = 1:ndata
    w = fullfile(wavfiles(i).folder, wavfiles(i).name);

    [f0, freq] = get_frequencypeaks(w,8,5);
    
    % get highest peaks
    F0 = f0;
    data_s.folder = wavfiles(i).folder;
    data_s.filename = wavfiles(i).name;
    data_s(i).f0 = F0;             % check fundamental frequency
    data_s(i).freq = freq;         % check the frequency
end

data_t = struct2table(data_s);

clc;
disp(data_t);
disp('=================================');
fprintf(['\nInstructions: \n   You could easily copy-paste \n' ...
    '   table data by selecting the ''data_t'' \n' ...
    '   variable in the workspace. \n\n']);
disp('=================================');

%% Select a particular spectrum here
row_number = 4;
get_mirspectrum(wavfiles, row_number);

% Observe the peak that has the lowest frequency. This will be your
% fundamental frequency.