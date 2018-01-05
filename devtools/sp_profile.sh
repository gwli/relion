sp="/raid/tools/SP/SystemProfiler-linux-internal-3.9.3364-05e1bbd/Target-x86_64/x86_64/sp"
TOP=`pwd`/..
exec_proc=$TOP/build/bin/relion_refine_mpi
data=$TOP/RELION_Benchmarks/Particles/shiny_2sets.star

rm -fr class2d
mkdir class2d

cmd="mpirun -n 20 $exec_proc --i $data --ctf --iter 2 --tau2_fudge 2 --particle_diameter 360 --K 200 --zero_mask --oversampling 1 --psi_step 6 --offset_range 5 --offset_step 2 --norm --scale --random_seed 0 --o class2d"

rm -fr ./*.QDSTRM
$sp profile --delay=2 --duration=10 -o mgemm.QDSTRM -t cuda,cublas,curand,pthread $cmd
