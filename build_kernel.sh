#!/bin/bash


# set toolchain
export ARCH=arm
#export CROSS_COMPILE=/home/simin/gcc-linaro-arm-linux-gnueabihf-4.8-2014.04_linux/bin/arm-linux-gnueabihf-
#export CROSS_COMPILE=/home/simin/gcctools/gcc-a15/arm-cortex_a15-linux-gnueabihf-linaro_4.9/bin/arm-cortex_a15-linux-gnueabihf-
export CROSS_COMPILE=/home/joe/toolchain/arm-cortex_a15-linux-gnueabihf-linaro_4.9.4-2015.06/bin/arm-cortex_a15-linux-gnueabihf-
#export CROSS_COMPILE=/opt/linaro/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-

#export CROSS_COMPILE=/home/simin/gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux/bin/arm-linux-gnueabihf-

# make zImage
mkdir -p ./out/done/modules/
#cm11的配置文件
# make O=./out cyanogen_cm11-ex_aries_defconfig
#cm12的配置文件
#make O=./out cyanogen_aries_defconfig
#Mokee 44.4
make O=./out aries-perf-usr_defconfig
make -j4 O=./out

# Copy Kernel Image and Modules
if [ $? -eq 0 ]
then
	echo "==================================="
	echo "          Compile success!"
	echo "==================================="
	cd out
	cp -f ./arch/arm/boot/zImage ./done/
	cp -r `find -iname '*.ko'` ./done/modules/
	cd -
else
	echo "==================================="
	echo "          Compile failed!"
	echo "==================================="
fi
