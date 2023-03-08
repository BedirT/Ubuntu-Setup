<h1>Ubuntu Setup<img align="right" width="300" src="ubuntu_logo.png"></h1>

This repository includes all the scripts and commands that I use to setup my Ubuntu machines. The tasks are varied by my job/research. I try to automate everything so that they are documented and I am not afraid to make a clean wipe and restart.

## Dual Monitor / Dual Boot Setup

### System Information
```
Ubuntu 22.04 LTS (Dual Boot with Windows 11)
NVIDIA GeForce RTX 3070
```
I use this setup for work and my personal use. I need Ubuntu for every development needs I have -Machine Learning, Deep Learning, App Development-, and I need Windows for my hobbies and again some dev work. I do use Windows for Blender + Adobe Products + Unreal Engine + Gaming. 

I also have a dual monitor setup, and even though it sounds straight forward it effects some of the decisions being made.

### Script steps
```bash
chmod +x bare_minimum_setup.sh
sudo ./bare_minimum_setup.sh
```

### Installation Includes
- Install Chrome
- Install Visual Studio Code
- Install Slack
- Install VLC
- Install Telegram
- Install Docker
- Install OBS-Studio
- Install Git
- Setup Git credentials
- Install Curl, Wget, Vim
- Setup the Dock with new apps
- Default python and pip to python3, pip3
- Change Wallpaper
- Install authenticator
- Setup refind for dual boot (Some manual work needed afterwards for preference based adjustments)
- Setup Nvidia Drivers to **470** and setup CUDA and CUDNN

## Research Setup / Game Theory
### System Information
```
Ubuntu 20.04.3 LTS
NVIDIA GeForce RTX 3070
```
Setup for my game theory research. Mainly this includes same steps from Bare Minimum Setup, and extends it with more C++ based tools and game theory specific needs.

### Script steps
```bash
chmod +x research_setup.sh
sudo ./research_setup.sh
```

## Installation Includes
- Install Visual Studio Code
- Install Git
- Setup Git credentials
- Install gcc
- Install g++
- Install cmake
- Install clang
- Install Nvidia Drivers / CUDA / CuDNN
- Install Tensorflow
- Install PyTorch
- Install PySpiel
- Install Necessary Python Packages (Given below)
- Install C# environment - SDK
- Setup Open Spiel
- Install VLC
- Install OBS-Studio

## NVIDIA-Cuda Setup
### System Information
```
Ubuntu 20.04.3 LTS
NVIDIA GeForce RTX 3070
```
This is a script that I use to setup CUDA and CUDNN on my machine. I have an NVIDIA RTX 3070, and I use CUDA 11.2. I have not tested this on other machines, but it should work for most NVIDIA GPUs. 

When running make sure to setup the versions correctly in the script, based on your GPU.

### Script steps
```bash
# Make sure to change the versions in the script
chmod +x nvidia_cuda.sh
sudo ./nvidia_cuda.sh
```

## Installation Includes
- Dynamic Version Setup
- Install Nvidia Drivers
- Install CUDA
- Install CUDNN
