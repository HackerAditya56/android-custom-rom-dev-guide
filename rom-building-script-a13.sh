#!/bin/bash

ccache -c # Cache clear

# Setup build environment
. build/envsetup.sh # you can change for your rom requrinment

# Configure ccache for faster builds
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
ccache -M 50G  # Increase cache size to 100GB for better reuse

# Configure device
lunch <device_codename>-user

mka derp -j$(($(nproc --all)*2))  # Use double the number of CPU cores for parallel jobs
