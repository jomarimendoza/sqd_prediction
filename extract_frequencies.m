%% Extract the frequencies of the selected 
clc; clear; close all; 
load('nontraditional_data.mat');
ndata = height(nontraditional_list_t);

for i = 1:ndata
    w = fullfile(getenv("DIR_DATASET"), nontraditional_list_t.wav_path{i});

    [f0, freq] = get_frequencypeaks(w,8,5);
    
    % get highest peaks
    F0 = f0;
    nontraditional_list(i).freq = freq;           % check the frequency
    nontraditional_list_t.f0(i) = F0;               % check fundamental frequency
end

%%
freqs = zeros(ndata,8);
for i = 1:ndata
    f = nontraditional_list(i).freq;
    freqs(i,1:length(f)) = f;
end

%% plot spectrograms

current_table = prototypes_comparison_t;
ndata = height(current_table);
nfft = 2^15;
for i = 30:ndata
    [x,fs] = audioread(fullfile(getenv("DIR_DATASET"),...
                                current_table.wav_path{i}));
    x = x(:,1);
        
    if strcmp('legato',nontraditional_list_t.playstyle{i})
        winlen = 0.04; % 40 ms
        winlap = winlen/2; 
    else
        winlen = 0.03; % 8 ms
        winlap = winlen/2; 
    end


    plot_spectrogram(x,fs,winlen*fs,winlap*fs,2^15);
    title(current_table.wav_path{i});
    pause;
end