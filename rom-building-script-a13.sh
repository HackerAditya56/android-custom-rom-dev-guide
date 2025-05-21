
# THIS SCRIPT IS JUST FOR ANDROID 13 CUSTOM ROM BUILD AFTER YOU CHNAGE THE NECESSARY CHANGES IN YOU DEVICE TREE.


#!/bin/bash

echo "Edit the device_codename according to your device name in your device tree"

echo "Edit the the_rom_you_are_making according to your rom"

echo "For more info do --> nano rom-building-script-a13.sh "

ccache -c # Cache clear

# Setup build environment
. build/envsetup.sh # you can change for your rom requrinment

# Configure ccache for faster builds
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
ccache -M 50G  # Increase cache size to 100GB for better reuse

# Configure device
lunch <device_codename>-user

mka <the_rom_you_are_making*> -j$(($(nproc --all)*2)) # * the_rom_you_are_making for eg. for derpfest = derp
# Use double the number of CPU cores for parallel jobs
