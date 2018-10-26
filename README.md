GEM-FISH is a program that calculates 3D chromosome models through integrating both Hi-C and FISH data with the prior biophysical knowledge about 3D polymers.

## Citation

Ahmed Abbas, Xuan He, Bin Zhou, Guangxiang Zhu, Zishan Ma, Jun-Tao Gao, Michael Q Zhang, and Jianyang Zeng. "Integrating Hi-C and FISH data for modeling 3D organizations of chromosomes". Submitted (April-2018)

## Installation

1- Download the source code of GEM-FISH (i.e., the file GEM-FISH-master.zip) by clicking the button "Download ZIP" as in the image.

![image1](https://user-images.githubusercontent.com/32098502/47552263-da603680-d936-11e8-8186-6600aaaf897f.png)

2- Extract the file GEM-FISH-master.zip

![screenshot2](https://user-images.githubusercontent.com/32098502/47286439-4da93600-d621-11e8-9d68-dc4116bbf5d6.png)

3- The extracted folder GEM-FISH-master has two zip files and a group of '.m' files. The first zip file: GEM-FISH_TAD-level-resolution.zip, has the Matlab scripts to calculate the TAD-level resolution 3D model of a chromosome. The second zip file: GEM-FISH_TAD-conformations.zip has the Matlab scripts to calculate the intra-TAD 3D structure of each individual TAD in the chromosome. The '.m' files in the folder are for the integrating the intra-TAD 3D models to the TAD-level resolution 3D model to produce the final high-resolution 3D model of the chromosome.

4- Extract the two zip files "GEM-FISH_TAD-conformations.zip" and "GEM-FISH_TAD-level-resolution.zip" in the folder GEM-FISH-master. The GEM-FISH-master contents should be as in the picture, 

![screenshot3](https://user-images.githubusercontent.com/32098502/47287981-ad561000-d626-11e8-96ec-79ee8bb26e15.png)

# Example for usage:

## To calculate a TAD-level-resolution 3D model for the chromosome, follow these steps:

a- Go into the folder GEM-FISH_TAD-level-resolution

![screenshot4](https://user-images.githubusercontent.com/32098502/47288442-b9db6800-d628-11e8-82a0-ebd2a5beced0.png)

b- Run the m-file 'run_chr21_rao.m' as in the picture below. 

![screenshot5](https://user-images.githubusercontent.com/32098502/47288469-d8416380-d628-11e8-9142-5d5e0705946d.png)

c- This will calculate the TAD-level-resolution 3D structure for an example chromosome (Chr21) in a file called "conformation1.txt", and will save it in a newly created folder "chr_21_TAD_level_resolution", as in the picture.

![screenshot6](https://user-images.githubusercontent.com/32098502/47288484-e8f1d980-d628-11e8-8bab-9e9628a4d5bb.png)

## To run some validation tests on the reconstructed 3D model of Chr21

a- Return back to the parent folder "GEM-FISH-master", as in the picture,

![screenshot7](https://user-images.githubusercontent.com/32098502/47289025-63235d80-d62b-11e8-8948-d59b4446b0ea.png)

b- Run the script: "validate_tad_level_model.m" to calculate the average relative error, number of correctly assigned TADs to A/B compartments, and the asphericity value of the reconstructed 3D model, as in picture:

![screenshot8](https://user-images.githubusercontent.com/32098502/47289028-6880a800-d62b-11e8-8f6c-d9a73bb4532e.png)

As in the picture, two figures showing the TADs assignment to A/B compartments. The upper one is using the 3D model reconstructed by GEM-FISH (as in its title), and the lower one using the experimental FISH data. As in the figures, only two TADs are wrongly assigned. 

In addition, on the matlab command window, the numeric results are appearing, 

Number of correctly assigned TADs = 32/34

Average relative error = 0.162

Asphericity value = 0.024


## Calculate the intra-TAD conformations of individual TADs as follows:

a- Go into the folder GEM-FISH_TAD-conformations

![tads1](https://user-images.githubusercontent.com/32098502/47345369-244de000-d6dd-11e8-8728-02eae68ae92c.png)
    
b- Run the m-file 'get_locals_chr21_Rao.m'. This will calculate the intra-TAD conformation of individual TADs of the example chromosome (Chr21).

![tads2](https://user-images.githubusercontent.com/32098502/47345996-b73b4a00-d6de-11e8-9a28-4ed1be3eff63.png)

This will calculate the 3D models of the 34 TADs of chr21 sequentially.

c- Instead, to calculate them in parallel, run the m-file 'get_locals_chr21_Rao_parallel.m'

![tads3](https://user-images.githubusercontent.com/32098502/47346352-8d365780-d6df-11e8-8db2-6066696b116d.png)


## Calculate the final 3D model of the chromosome

a- Go back to the parent folder GEM-FISH
    
 ![final1](https://user-images.githubusercontent.com/32098502/47346730-57de3980-d6e0-11e8-8f47-f4a118a68876.png)
   
b- Run the m-file 'final_model_chr21.m'. This will calculate the final 3D model of the chromosome investigated (Chr21 in our case)

 ![new_image](https://user-images.githubusercontent.com/32098502/47552149-94a36e00-d936-11e8-896e-20f40fa8a237.png)
 
c- The final 3D structure is written in the file 'final_model.txt' in the GEM_FISH folder

## Running some validation tests on the final 3D models

We added a folder containing the final 3D models reconstructed by GEM-FISH for the Chrs 20, 21, and 22. 

a- Extract the folder "validation_tests_final_models.zip"

![v1](https://user-images.githubusercontent.com/32098502/47443623-59def000-d7e7-11e8-8c18-c440af489b73.png)

b- Go to the extracted folder in Matlab as shown in picture

![v2](https://user-images.githubusercontent.com/32098502/47443898-e4bfea80-d7e7-11e8-971d-f736a5ed2337.png)

### Test the spatial distributions of super-enhancers and regular enhancers

a- To test the spatial distributions of super-enhancers and regular enhancers, go to the folder "validation_super_enhancers" as shown

![v3](https://user-images.githubusercontent.com/32098502/47444048-30729400-d7e8-11e8-86c0-985794c37c2e.png)

b- Run the m-file "call_validate_SE.m", which will draw a boxplot showing the normalized radial distances of super-enhancers and regular enhancers in the three autosomes 20, 21, and 22. It will also calculate the p-value using Wilcoxon rank sum test as in picture

![v4](https://user-images.githubusercontent.com/32098502/47444284-bbec2500-d7e8-11e8-9b6a-d08fb0fe8a4c.png)

### Test the spatial distributions of the genomic sites interacting with the nuclear pore complex component Nup153

a- To test the spatial distributions of the genomic sites interacting with the nuclear pore complex component Nup153 in the three autosomes, go to folder "validate_Nup153_radial_distribution" as shown in picture

![v5](https://user-images.githubusercontent.com/32098502/47444465-19807180-d7e9-11e8-8b81-14a5fe21df42.png)

b- Run the m-file "call_validate_Nup153.m", which will compare the spatial distributions of genomic sites interacting with Nup153 to random loci of same genomic lengths (denoted by Control-Nup), as shown in picture

![v6](https://user-images.githubusercontent.com/32098502/47444728-b7743c00-d7e9-11e8-86c9-7b4ecc850096.png)

Note that the result will change if we run the same script again, because in each time it will select a new set of random loci, as shown in the picture

![v7](https://user-images.githubusercontent.com/32098502/47444852-03bf7c00-d7ea-11e8-8cb4-e026d6964a4c.png)

### Test the packing densities between loop and control anchor loci

a- Go to the folder "validating_loop_loci" as shown in the picture

![loop_loci](https://user-images.githubusercontent.com/32098502/47555518-98d38980-d93e-11e8-9834-d52d8065748d.png)

b- To draw the boxplots of the packing densities between loop and control anchor loci for Chr20, type: validating_loops('20',5000) as shown in the picture, where 5000 is the resolution of the intra-TAD 3D models (i.e., each point in the intra-TAD 3D models represents 5 Kbp)

![l1](https://user-images.githubusercontent.com/32098502/47562546-64b59400-d951-11e8-99b7-aae5fc4531c3.png)

The p-value is calculated using one-tailed Wilcoxon rank sum test

c- To draw the boxplots of the packing densities between loop and control anchor loci for Chr20, type: validating_loops('21',5000) as shown in the picture

![l2](https://user-images.githubusercontent.com/32098502/47562548-67b08480-d951-11e8-88b8-1506730a25e0.png)

=================================================================================

For any questions or bug-reporting, please contact: ahmedabbas@mail.tsinghua.edu.cn
