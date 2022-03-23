function [f0, frequencies] = get_frequencypeaks(filename,npeaks,sl)
%GET_FREQUENCYPEAKS extracts the frequency peaks of the wave file using
%mirtoolbox. 
%   input:  filename - the wavefile to determine the frequency
%           npeaks - number of peaks to extract
%           sl - smoothing window length
%   output: f0 - fundamental frequencies
%           frequencies - freqency peaks, not necessarily harmonics

f = mirgetdata(mirpitch(filename, 'Reso','SemiTone',...
                                  'Order','Abscissa', ...
                                  'Total', 3));

try
    f = sort(f);    % partial frequencies
    f0 = f(1);      % fundamental frequency
catch 
    f0 = 0;
end

% get peaks on smooth spectrum to exclude closely place peaks
frequencies = mirgetdata(mirpeaks(mirspectrum(filename,'db',...
                    'Min',120,...
                    'Smooth',sl),...
                    'Reso','SemiTone',...
                    'Order','Abscissa',...
                    'Total', npeaks));

end

