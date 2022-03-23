# BMI Sound Characterization
This project determines the sound quality descriptor (timbre) scores of 
different bamboo musical instruments in the Philippines.

## Extraction of the fundamental frequencies

First, we determine pitch of the BMI samples by following the instructions below:

### Prerequisite:
Download the MIR toolbox [here](https://www.jyu.fi/hytk/fi/laitokset/mutku/en/research/materials/mirtoolbox).

### 1. Edit <em>include.m</em>
> dataset_dir = 'folder/containing/audiodata' 

> toolboxes_dir = 'path/to/MIRToolbox'

### 2. Run <em>extract_frequencies.m</em>
In the MATLAB <em>Command Window</em>, enter the following:
> ->> extract_frequencies

The script will automatically extract the desired frequencies and stores it in a local variable.
> **Double-click** on 'data_t' variable in <em>Workspace</em> to view a table format of the frequencies.

You can now copy these values to a local spreadsheet for further analysis.