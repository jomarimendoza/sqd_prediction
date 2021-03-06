function get_mirspectrum(wavfiles,index)
%GET_MIRSPECTRUM displays the mirspectrum of wavfiles in the list.
%   
%   input:  wavfiles - struct obtained by using dir
%           index - index number of the desired file

path_to_wav = fullfile(wavfiles(index).folder, wavfiles(index).name);
mirpeaks(mirspectrum(path_to_wav,'db'),'Total',5)
fprintf('Displaying %s ...\n\n', path_to_wav)

end

