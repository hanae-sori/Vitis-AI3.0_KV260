#!/bin/bash

# Root directory of the project
PROJECT_DIR="/home/hanaesori/workspace/Vitis-AI_2.0/dsa/DPU-TRD/prj/Vivado/dpu_petalinux_bsp"

# Script to replace old syntax with the new one
find $PROJECT_DIR -type f \( -name "*.bb" -o -name "*.bbappend" \) -exec sed -i 's/FILESEXTRAPATHS_prepend/FILESEXTRAPATHS:prepend/g' {} \;
find $PROJECT_DIR -type f \( -name "*.bb" -o -name "*.bbappend" \) -exec sed -i 's/PACKAGECONFIG_append/PACKAGECONFIG:append/g' {} \;
find $PROJECT_DIR -type f \( -name "*.bb" -o -name "*.bbappend" \) -exec sed -i 's/EXTRA_OECONF_append/EXTRA_OECONF:append/g' {} \;
find $PROJECT_DIR -type f \( -name "*.bb" -o -name "*.bbappend" \) -exec sed -i 's/CFLAGS_prepend/CFLAGS:prepend/g' {} \;
find $PROJECT_DIR -type f \( -name "*.bb" -o -name "*.bbappend" \) -exec sed -i 's/INSANE_SKIP_${PN}_append/INSANE_SKIP:${PN}:append/g' {} \;
find $PROJECT_DIR -type f \( -name "*.bb" -o -name "*.bbappend" \) -exec sed -i 's/do_install_append/do_install:append/g' {} \;
find $PROJECT_DIR -type f \( -name "*.bb" -o -name "*.bbappend" \) -exec sed -i 's/SRC_URI_append/SRC_URI:append/g' {} \;
find $PROJECT_DIR -type f \( -name "*.bb" -o -name "*.bbappend" \) -exec sed -i 's/do_configure_prepend/do_configure:prepend/g' {} \;
find $PROJECT_DIR -type f \( -name "*.bb" -o -name "*.bbappend" \) -exec sed -i 's/KERNEL_FEATURES_append/KERNEL_FEATURES:append/g' {} \;

echo "Old override syntax has been updated to the new syntax."

