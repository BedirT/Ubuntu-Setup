# Setup the system for deep learning, rl and game theory
# - Personal tools that I use
# PC must be ready for TensorFlow & PyTorch
#
USER_NAME="BedirT"
EMAIL="tapkan@ualberta.ca"

if ! gcc --version > /dev/null 2>&1; then    
    sudo apt install build-essential
fi

sudo snap install slack --classic # Slack
sudo snap install --classic code # VS Code
sudo apt install git vim # git, vim
git config --global user.name ${USER_NAME}
git config --global user.email ${EMAIL}

if [ -f /usr/bin/nvidia-smi ]; then
    echo "\e[32mNVIDIA drivers working properly\e[0m"
else
    # Prompt the user to install the nvidia drivers
    echo "\033[31mPlease install the nvidia drivers\033[0m"
    exit
fi

if [ -f /usr/local/cuda/bin/nvcc ]; then
    echo "\e[32mCUDA Toolkit is installed\e[0m"
else
    # Prompt the user to install the CUDA Toolkit
    echo "\e[31mPlease install the CUDA Toolkit\e[0m"
    exit
fi

# Install python3-pip
if ! pip3 --version > /dev/null 2>&1; then
    sudo apt install python3-pip
fi

# set python to python3
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1
sudo update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1

sudo apt install python3-venv python3-dev
pip3 install --upgrade pip 
pip3 install ysetuptools numpy matplotlib scikit-learn pandas

# TensorFlow & PyTorch
# Install TensorFlow
pip3 install tensorflow-gpu
pip3 install tensorflow torch torchvision

# Go to Documents folder and create a new folder named "research"
cd ~/Documents
mkdir research
cd research

sudo apt-get install cmake clang

# Setup open spiel
git clone https://github.com/deepmind/open_spiel
cd open_spiel
./install.sh
virtualenv -p python3 venv
source venv/bin/activate
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py
pip3 install --upgrade pip
pip3 install --upgrade setuptools testresources
pip3 install -r requirements.txt
./open_spiel/scripts/build_and_run_tests.sh

# set bashrc
echo "export PYTHONPATH=$PYTHONPATH:/<path_to_open_spiel>" >> ~/.bashrc
# For the python modules in open_spiel.
echo "export PYTHONPATH=$PYTHONPATH:/<path_to_open_spiel>/build/python" >> ~/.bashrc
# For the Python bindings of Pyspiel

# install c#
sudo apt install mono-complete

# install openai gym
pip3 install gym
