function [f0, frequencies] = get_frequencypeaks(filename,npeaks,sl)
%GET_FREQUENCYPEAKS extracts the frequency peaks of the wave file using
%mirtoolbox. 
%   input:  filename - the wavefile to determine the frequency
%           npeaks - number of peaks to extract
%           sl - smoothing window length
%   output:  

% get the fundamental freuqency
f = mirgetdata(mirpitch(filename, 'Reso','SemiTone',...
                                  'Order','Abscissa', ...
                                  'Total', 3));
f = sort(f);
f0 = f(1);

% get peaks on smooth spectrum to exclude closely place peaks
frequencies = mirgetdata(mirpeaks(mirspectrum(filename,'db',...
                    'Min',120,...
                    'Smooth',sl),...
                    'Reso','SemiTone',...
                    'Order','Abscissa',...
                    'Total',npeaks));



end

