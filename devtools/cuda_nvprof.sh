TOP=`pwd`/..
exec_proc=$TOP/build/bin/relion_refine_mpi
data=$TOP/RELION_Benchmarks/Particles/shiny_2sets.star

rm -fr class2d
mkdir class2d

cmd="mpirun -n 20 $exec_proc --i $data --ctf --iter 2 --tau2_fudge 2 --particle_diameter 360 --K 200 --zero_mask --oversampling 1 --psi_step 6 --offset_range 5 --offset_step 2 --norm --scale --random_seed 0 --o class2d"

nvprof --csv $cmd
mvprof --query-events
nvprof --query-metrics
nvprof --events inst_executed $cmd
nvprof --metrics all $cmd
nvprof --metrics inst_executed $cmd
nvprof --aggregate-mode-off --source-level-analysis global_access,shared_access,branch,instruction_execution,pc_sampling $cmd

