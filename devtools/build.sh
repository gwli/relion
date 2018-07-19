TOP=`pwd`/..
cd $TOP
git pull
#git checkout 9a8dfbae0d78e7ece3847a053e10ffccd7ab18d8
rm build
mkdir build
cd build
# disable gui if build in docker
cmake .. -DGUI=OFF -DCUDA=ON -DCUDA_ARCH=52 \
-DGUI=OFF -DCMAKE_EXE_LINKER_FLAGS=-L$(dirname $(which nvcc))/../lib64 \
-DCMAKE_SHARED_LINKER_FLAGS=-L$(dirname $(which nvcc))/../lib64
make -j

