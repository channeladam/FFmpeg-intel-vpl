#!/bin/sh

# https://trac.ffmpeg.org/wiki/CompilationGuide
# https://trac.ffmpeg.org/wiki/CompilationGuide/Generic

# NOTE: This script assumes the following packages are already installed:
# - intel-oneapi-basekit
# - nasm
# yay -S --asdeps --noconfirm nasm

# NOTE: Automatic Library Paths
# If you have sourced /opt/intel/oneapi/vpl/latest/env/vars.sh into your environment,
# this environment variable is set: PKG_CONFIG_PATH=/opt/intel/oneapi/vpl/2022.2.0/lib/pkgconfig
# You may need to fix the paths listed in /opt/intel/oneapi/vpl/latest/lib/pkgconfig/vpl.pc
# as they were incorrect for me and screwed up the library paths - thus preventing the vpl library to be found.
# This works:
#   prefix=/opt/intel/oneapi/vpl/latest/lib/pkgconfig/../../
#   libdir=/opt/intel/oneapi/vpl/latest/lib/pkgconfig/../
#   includedir=/opt/intel/oneapi/vpl/latest/lib/pkgconfig/../../include

# sh -x configure \

./configure \
    --prefix='/usr' \
    --disable-debug \
    --disable-static \
    --disable-stripping \
    --enable-lto \
    --enable-fontconfig \
    --enable-gmp \
    --enable-gnutls \
    --enable-gpl \
    --enable-libaom \
    --enable-libass \
    --enable-libbluray \
    --enable-libdav1d \
    --enable-libdrm \
    --enable-libfreetype \
    --enable-libfribidi \
    --enable-libgsm \
    --enable-libiec61883 \
    --enable-libjack \
    --enable-libmodplug \
    --enable-libopencore_amrnb \
    --enable-libopencore_amrwb \
    --enable-libopenjpeg \
    --enable-libopus \
    --enable-libpulse \
    --enable-librav1e \
    --enable-librsvg \
    --enable-libsoxr \
    --enable-libspeex \
    --enable-libsrt \
    --enable-libssh \
    --enable-libsvtav1 \
    --enable-libtheora \
    --enable-libv4l2 \
    --enable-libvidstab \
    --enable-libvmaf \
    --enable-libvorbis \
    --enable-libvpl \
    --enable-libvpx \
    --enable-libwebp \
    --enable-libx264 \
    --enable-libx265 \
    --enable-libxcb \
    --enable-libxml2 \
    --enable-libxvid \
    --enable-libzimg \
    --enable-shared \
    --enable-version3

echo 'Making'
make

# Install the libraries into the PREFIX folder
echo 'Installing'
sudo make install
