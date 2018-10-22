GEM-FISH is a program that calculates 3D chromosome models through integrating both Hi-C and FISH data with the prior biophysical knowledge about 3D polymers.

Citation

Ahmed Abbas, Xuan He, Bin Zhou, Guangxiang Zhu, Zishan Ma, Jun-Tao Gao, Michael Q Zhang, and Jianyang Zeng. "Integrating Hi-C and FISH data for modeling 3D organizations of chromosomes". Submitted (April-2018)

Installation
![screenshot1](https://user-images.githubusercontent.com/32098502/47285956-5bf65280-d61f-11e8-9bf2-1865fee6f405.png)

1- Download the source code of GEM-FISH (i.e., the file GEM-FISH-master.zip) by clicking the button "Download ZIP" as in the image.

2- Extract the file GEM-FISH-master.zip

![screenshot2](https://user-images.githubusercontent.com/32098502/47286439-4da93600-d621-11e8-9d68-dc4116bbf5d6.png)

3- The extracted folder GEM-FISH-master has two zip files and a group of '.m' files. The first zip file: GEM-FISH_TAD-level-resolution.zip, has the Matlab scripts to calculate the TAD-level resolution 3D model of a chromosome. The second zip file: GEM-FISH_TAD-conformations.zip has the Matlab scripts to calculate the intra-TAD 3D structure of each individual TAD in the chromosome. The '.m' files in the folder are for the integrating the intra-TAD 3D models to the TAD-level resolution 3D model to produce the final high-resolution 3D model of the chromosome.

4- Extract the two zip files "GEM-FISH_TAD-conformations.zip" and "GEM-FISH_TAD-level-resolution.zip" in the folder GEM-FISH-master. The GEM-FISH-master contents should be as in the picture, 

![screenshot3](https://user-images.githubusercontent.com/32098502/47287981-ad561000-d626-11e8-96ec-79ee8bb26e15.png)

Example for usage:

1- To calculate a TAD-level-resolution 3D model for the chromosome, follow these steps:

a- Go into the folder GEM-FISH_TAD-level-resolution

![screenshot4](https://user-images.githubusercontent.com/32098502/47288442-b9db6800-d628-11e8-82a0-ebd2a5beced0.png)

b- Run the m-file 'run_chr21_rao.m' as in the picture below. 

![screenshot5](https://user-images.githubusercontent.com/32098502/47288469-d8416380-d628-11e8-9142-5d5e0705946d.png)

c- This will calculate the TAD-level-resolution 3D structure for an example chromosome (Chr21) in a file called "conformation1.txt", and will save it in a newly created folder "chr_21_TAD_level_resolution", as in the picture.

![screenshot6](https://user-images.githubusercontent.com/32098502/47288484-e8f1d980-d628-11e8-8bab-9e9628a4d5bb.png)

2- To run some validation tests on the reconstructed 3D model of Chr21

a- Return back to the parent folder "GEM-FISH-master", as in the picture,

![screenshot7](https://user-images.githubusercontent.com/32098502/47289025-63235d80-d62b-11e8-8948-d59b4446b0ea.png)

b- Run the script: "validate_tad_level_model.m" to calculate the average relative error, number of correctly assigned TADs to A/B compartments, and the asphericity value of the reconstructed 3D model, as in picture:

![screenshot8](https://user-images.githubusercontent.com/32098502/47289028-6880a800-d62b-11e8-8f6c-d9a73bb4532e.png)

As in the picture, two figures showing the TADs assignment to A/B compartments. The upper one is using the 3D model reconstructed by GEM-FISH (as in its title), and the lower one using the experimental FISH data. As in the figures, only two TADs are wrongly assigned. 

In addition, on the matlab command window, the numeric results are appearing, 

Number of correctly assigned TADs = 32/34

Average relative error = 0.162

Asphericity value = 0.024


2- Calculate the intra-TAD conformations of individual TADs as follows:

a- Go into the folder GEM-FISH_TAD-conformations
    
b- Run the m-file 'get_locals_chr21_Rao.m'. This will calculate the intra-TAD conformation of individual TADs of the example chromosome (Chr21).

3- Calculate the final 3D model of the chromosome

a- Go back to the parent folder GEM-FISH
    
b- Run the m-file 'final_model_chr21.m'. This will calculate the final 3D model of the chromosome investigated (Chr21 in our case)
    
c- The final 3D structure is written in the file 'final_model.txt' in the GEM_FISH folder

=================================================================================

For any questions or bug-reporting, please contact: ahmedabbas@mail.tsinghua.edu.cn
