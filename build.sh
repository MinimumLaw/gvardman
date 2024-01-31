#!/bin/bash

if [ -z $BUILDROOT_BASE ]; then
    export BUILDROOT_BASE=`pwd`/../buildroot
fi

if [ -z $BUILDROOT_BRANCH ]; then
    export BUILDROOT_BRANCH=2023.11.x
fi

export BUILDROOT_EXT_TREE=`pwd`
export OUTPUT_DIR=`pwd`/build/orangepi3_lts
export NPRC_ARGS="-j `cat /proc/cpuinfo | grep processor | wc -l`"
export MAKE_ARGS="${NPRC_ARGS} O=${OUTPUT_DIR} BR2_EXTERNAL=${BUILDROOT_EXT_TREE} -C ${BUILDROOT_BASE}"

echo Actualise buildroot
mkdir -p ${BUILDROOT_BASE}
pushd ${BUILDROOT_BASE}
if [ -x .git ]; then
git pull
else
git clone https://git.buildroot.net/buildroot
fi
git checkout ${BUILDROOT_BRANCH}
popd

mkdir -p ${OUTPUT_DIR}
pushd ${OUTPUT_DIR}
    if [ -f .config ]; then
	make ${MAKE_ARGS} $*
    else
	make ${MAKE_ARGS} orangepi3_lts_defconfig
	make ${MAKE_ARGS} $*
    fi
popd

if [ -f ${OUTPUT_DIR}/images/sdcard.img ]; then
	echo "Write result image to flash-drive with command:"
	echo "sudo dd if=${OUTPUT_DIR}/images/sdcard.img of=/dev/flash bs=1M status=progress conv=sync"
fi
