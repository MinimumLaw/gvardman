# gvardman-buildroot

Gvardman buildroot template

HowTo build and check:

Prerequirements:
  You need Linux based distro (Debian, Ubuntu) with installed developer packages

Prepare:
1. Make working directory
 $ mkdir progect
2. Change working direcctory as current
 $ cd project
3. Clone buildroot git tree from officaial source
 $ git clone https://git.buildroot.net/buildroot
4. Clone this repositary from github
 $ git clone https://github.com/MinimumLaw/gvardman.git
5. Change work directory to gvardman
 $ cd gvardman
6. Run build process
 $ ./build.sh
7. Just wait for competion...
8. You have output sdcard.img into build/orangepi3_lts/images directory
 $ ls build/orangepi3_lts/images
 bl31.bin   extlinux  orangepi3-lts.dtb  rootfs.cpio     sdcard.img  u-boot-sunxi-with-spl.bin
 boot.vfat  Image     params.ext2        rootfs.cpio.xz  u-boot.bin
 $
9. You may write then to sd-card with diskdup utility
 $ sudo dd if=${OUTPUT_DIR}/images/sdcard.img of=/dev/flash bs=1M status=progress conv=sync
10. Cross-compiler will be in build/orangepi3_lts/host directory, use them as you want
11. Example of private buildroot packages you can see in package/* directory or in buildroot
    documentation https://buildroot.org/downloads/manual/manual.html#adding-packages

    For Dmitry:
    Example for package, builded with Scons build system in buildroot is gpsd daemon:
    https://git.buildroot.net/buildroot/tree/package/gpsd/gpsd.mk
    You can use them as template for you personal private package
12. Have fun! Don't worry, be happy!

