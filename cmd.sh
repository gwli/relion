#mpirun -n XXX `which relion_refine_mpi` --i Particles/shiny_2sets.star --ctf --iter 25 --tau2_fudge 2 --particle_diameter 360 --K 200 --zero_mask --oversampling 1 --psi_step 6 --offset_range 5 --offset_step 2 --norm --scale --random_seed 0 --o class2d
mpirun -n 20 /raid/HPC/relion_new/relion/build/bin/relion_refine_mpi --i Particles/shiny_2sets.star --ctf --iter 25 --tau2_fudge 2 --particle_diameter 360 --K 200 --zero_mask --oversampling 1 --psi_step 6 --offset_range 5 --offset_step 2 --norm --scale --random_seed 0 --o class2d


