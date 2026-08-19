# Development environment for vision-lab.
# Uses the project flow: Conan 1 + cmake-conan 0.18.1 + CMakePresets.
FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN echo "Updating Ubuntu..."
RUN apt-get update
RUN apt-get upgrade -y

RUN echo "Installing dependencies..."
RUN apt-get install -y --no-install-recommends \
        build-essential \
        ccache \
        cmake \
        curl \
        doxygen \
        git \
        graphviz \
        ninja-build \
        pkg-config \
        python3 \
        python3-pip \
        tar \
        unzip

RUN echo "Installing Conan system requirements..."
RUN apt-get install -y --no-install-recommends \
        libva-dev \
        libvdpau-dev \
        libx11-dev \
        libx11-xcb-dev \
        libfontenc-dev \
        libice-dev \
        libsm-dev \
        libxau-dev \
        libxaw7-dev \
        libxcomposite-dev \
        libxcursor-dev \
        libxdamage-dev \
        libxdmcp-dev \
        libxext-dev \
        libxfixes-dev \
        libxi-dev \
        libxinerama-dev \
        libxkbfile-dev \
        libxmu-dev \
        libxmuu-dev \
        libxpm-dev \
        libxrandr-dev \
        libxrender-dev \
        libxres-dev \
        libxss-dev \
        libxt-dev \
        libxtst-dev \
        libxv-dev \
        libxxf86vm-dev \
        libxcb-glx0-dev \
        libxcb-render0-dev \
        libxcb-render-util0-dev \
        libxcb-xkb-dev \
        libxcb-icccm4-dev \
        libxcb-image0-dev \
        libxcb-keysyms1-dev \
        libxcb-randr0-dev \
        libxcb-shape0-dev \
        libxcb-sync-dev \
        libxcb-xfixes0-dev \
        libxcb-xinerama0-dev \
        libxcb-dri3-dev \
        uuid-dev \
        libxcb-cursor-dev \
        libxcb-dri2-0-dev \
        libxcb-present-dev \
        libxcb-composite0-dev \
        libxcb-ewmh-dev \
        libxcb-res0-dev \
        libxcb-util-dev

RUN echo "Installing Conan 1..."
RUN python3 -m pip install --break-system-packages --no-cache-dir conan==1.65.0

# Usage (latest flow):
#   docker build -t visionlab .
#   docker run --rm -it -v "$(pwd)":/workspace -v visionlab-conan:/root/.conan -w /workspace visionlab
#   cmake --preset debug
#   cmake --build --preset debug
#   ./build/bin/Debug/visionlab
#
# The first configure downloads/builds OpenCV through Conan (opencv/4.5.5);
# the named volume keeps the Conan cache between runs, so later builds are fast.
