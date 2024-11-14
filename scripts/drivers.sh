#!/bin/bash

## GPU Drivers Installation ##
echo "Please Select Your GPU Driver/Tools"
gpu_option=("intel" "amd" "nvidia-open" "nvidia-proprietary")
select gpu in "${gpu_option[@]}"; do
  if [ "$gpu" = "intel" ]; then
    apt install xserver-xorg-video-intel -y
    break
  elif [ "$gpu" = "amd" ]; then
    apt install xserver-xorg-video-amdgpu -y
    break
  elif [ "$gpu" = "nvidia-open" ]; then
    apt install xserver-xorg-video-nouveau -y
    break
  elif [ "$gpu" = "nvidia-proprietary" ]; then
    apt install nvidia-cuda-dev nvidia-cuda-toolkit -y
    break
  fi
done
