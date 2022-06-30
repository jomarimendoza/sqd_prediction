function [data_t] = get_frequency_features(wavdir, with_features)
%GET_FREQUENCY_FEATURES extracts the f0 and other spectral features of the
%wav files in a folder using MIR toolbox.
%
%   Detailed explanation goes here

arguments
    wavdir (1,1) string;
    with_features = false;
end

wavfiles = dir(fullfile(wavdir, '**/*.wav'));   % this includes subfolders

ndata = length(wavfiles);

h = waitbar(0,'Compute spectral features of the audio samples...');

for i = 1:ndata
    w = fullfile(wavfiles(i).folder, wavfiles(i).name);

    [f0, freq] = get_frequencypeaks(w, 8, 5);
    
    % get highest peaks
    F0 = f0;
    data_s(i).folder = wavfiles(i).folder;
    data_s(i).filename = wavfiles(i).name;
    data_s(i).f0 = F0;             % check fundamental frequency
    data_s(i).freq = freq;         % check the frequency

    if with_features
        % extract other spectral features
        data_s(i).centroid = mirgetdata(mircentroid(w));
        data_s(i).spread = mirgetdata(mirspread(w));
        data_s(i).skewness = mirgetdata(mirskewness(w));
        data_s(i).kurtosis = mirgetdata(mirkurtosis(w));
        data_s(i).rolloff = mirgetdata(mirrolloff(w));
        data_s(i).entropy = mirgetdata(mirentropy(w));
        data_s(i).flatness = mirgetdata(mirflatness(w));
        data_s(i).regularity = mirgetdata(mirregularity(w));
        data_s(i).inharmonicity = mirgetdata(mirinharmonicity(w),'f0',F0);
    end

    waitbar(i/ndata, h);
end
close(h);

data_t = struct2table(data_s);

end

