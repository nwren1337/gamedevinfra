# Stage 1: Build Stage
FROM ubuntu:22.04 as builder

# Install build dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    clang \
    cmake \
    git \
    wget \
    unzip \
    libgtk-3-dev \
    mono-complete \
    && rm -rf /var/lib/apt/lists/*

# Clone Unreal Engine source
RUN git clone -b 5.4 https://github.com/EpicGames/UnrealEngine.git /UnrealEngine

# Build Unreal Engine
WORKDIR /UnrealEngine
RUN ./Setup.sh && ./GenerateProjectFiles.sh && make

# Stage 2: Runtime Stage
FROM ubuntu:22.04

# Install only runtime dependencies
RUN apt-get update && apt-get install -y \
    libgtk-3-dev \
    libssl-dev \
    libjsoncpp-dev \
    libxml2-dev \
    libcurl4-openssl-dev \
    libfreetype6-dev \
    libncurses5-dev \
    libxrandr-dev \
    libxinerama-dev \
    libxi-dev \
    libxext-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy Unreal Engine binaries from the builder stage
COPY --from=builder /UnrealEngine /UnrealEngine

# Set working directory
WORKDIR /UnrealEngine

# Define the entry point
ENTRYPOINT ["/bin/bash"]
