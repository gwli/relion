git pull
#git checkout 9a8dfbae0d78e7ece3847a053e10ffccd7ab18d8
mkdir build
cd build
cmake .. -DGUI=OFF -DCUDA=ON -DCUDA_ARCH=60 \
-DGUI=ON -DCMAKE_EXE_LINKER_FLAGS=-L$(dirname $(which nvcc))/../lib64 \
-DCMAKE_SHARED_LINKER_FLAGS=-L$(dirname $(which nvcc))/../lib64
make -j

