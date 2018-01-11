sp="/raid/tools/SP/SystemProfiler-linux-public-3.9.3747-52a8955/Target-x86_64/x86_64/sp"
TOP=`pwd`/..
exec_proc=$TOP/build/bin/relion_refine_mpi
BMDir=$TOP/RELION_Benchmarks

cd $BMDir
rm -fr class2d
mkdir class2d

cmd="mpirun -n 20 $exec_proc --i Particles/shiny_2sets.star --ctf --iter 2 --tau2_fudge 2 --particle_diameter 360 --K 200 --zero_mask --oversampling 1 --psi_step 6 --offset_range 5 --offset_step 2 --norm --scale --random_seed 0 --o class2d"
echo "running $cmd"
rm -fr ./*.qdstrm
$sp profile --delay=30 --duration=10 -o mgemm.qdstrm -t cuda,cudnn,cublas,curand,pthread $cmd
