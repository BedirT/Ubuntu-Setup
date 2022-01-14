# Set up NVIDIA drivers and CUDA toolkit
# Make system ready for TensorFlow & PyTorch
# 
# Author: M Bedir Tapkan
# Date:   2022-01-14
#
# Ubuntu 20.04 LTS
# GPU: GeForce RTX 3070
# NVIDIA Driver: 470.94
# CUDA Toolkit: 11.2
TEMP_FILE=./temp_gpu
NVIDIA_DRIVER_VERSION=470.94
CUDA_TOOLKIT_VERSION=11.2.0
CUDA_DRIVER_VERSION=460.27.04

sudo apt update
if ! gcc --version > /dev/null 2>&1; then    
    sudo apt install build-essential
fi

# pkg-config and the libglvnd package are required to build the
# nvidia-cuda-toolkit package.
if ! pkg-config --version > /dev/null 2>&1; then
    sudo apt install pkg-config
fi

if ! libglvnd-dev --version > /dev/null 2>&1; then
    sudo apt install libglvnd-dev
fi

if [ ! -d $TEMP_FILE ]; then
    mkdir $TEMP_FILE
fi
cd $TEMP_FILE

# run nvidia-smi to check if the driver is installed
if [ -f /usr/bin/nvidia-smi ]; then
    echo "NVIDIA drivers working properly"
else
    # Install NVIDIA drivers NVIDIA-Linux-x86_64-(version).run
    if [ ! -d ./NVIDIA-Linux-x86_64-$NVIDIA_DRIVER_VERSION.run ]; then
        wget -c https://us.download.nvidia.com/XFree86/Linux-x86_64/$NVIDIA_DRIVER_VERSION/NVIDIA-Linux-x86_64-$NVIDIA_DRIVER_VERSION.run
        chmod +x NVIDIA-Linux-x86_64-$NVIDIA_DRIVER_VERSION.run
    fi
    sudo ./NVIDIA-Linux-x86_64-$NVIDIA_DRIVER_VERSION.run
    echo "Completing the installation;"
    echo "Rebooting..."
    sudo reboot
fi

# Install CUDA Toolkit
wget https://developer.download.nvidia.com/compute/cuda/$CUDA_TOOLKIT_VERSION/local_installers/cuda_${CUDA_TOOLKIT_VERSION}_${CUDA_DRIVER_VERSION}_linux.run
sudo sh cuda_${CUDA_TOOLKIT_VERSION}_${CUDA_DRIVER_VERSION}_linux.run

# Set the env variables on .bashrc
echo "export PATH=/usr/local/cuda-${CUDA_VERSION}/bin:$PATH" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=/usr/local/cuda-${CUDA_VERSION}/lib64:$LD_LIBRARY_PATH" >> ~/.bashrc

# Install CuDNN
VERSION_FULL="8.1.0.77"
VERSION="${VERSION_FULL%.*}"
CUDA_VERSION="11.2"
OS_ARCH="linux-x64"
CUDNN_URL="https://developer.download.nvidia.com/compute/redist/cudnn/v${VERSION}/cudnn-${CUDA_VERSION}-${OS_ARCH}-v${VERSION_FULL}.tgz" 
wget -c ${CUDNN_URL}

tar -xzvf cudnn-${CUDA_VERSION}-${OS_ARCH}-v${VERSION_FULL}.tgz

sudo cp cuda/include/cudnn*.h /usr/local/cuda/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn*.h /usr/local/cuda/lib64/libcudnn*

# Delete the temp file
cd ..
rm -rf $TEMP_FILE