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
