% include necessary directories for scripts
addpath(genpath('utils'));

%% Set environment variables

dataset_dir = '.';      % EDIT: change to the dataset directory
toolboxes_dir = '.';    % EDIT: change to the MIRToolbox directory
figures_dir = '.';      % EDIT: change to output plots directory
videos_dir = '.';       % EDIT: change to output videos directory

setenv('DIR_DATASET', dataset_dir);
setenv('DIR_TOOLBOX', toolboxes_dir)
setenv('outdir_plots', figures_dir);     
setenv('outdir_video', videos_dir);     

addpath(genpath(getenv('DIR_TOOLBOX'))); 

% do not show warnings
warning('off','all');