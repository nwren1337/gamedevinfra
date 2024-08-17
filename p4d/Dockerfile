FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    tar \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Download and install Perforce Helix Core
RUN wget -O /usr/local/bin/p4d https://cdist2.perforce.com/perforce/r21.1/bin.linux26x86_64/p4d
RUN chmod +x /usr/local/bin/p4d

# Create directories for Perforce data
RUN mkdir -p /opt/perforce/servers/p4root
RUN mkdir -p /opt/perforce/servers/logs

# Expose the default Perforce port
EXPOSE 1666

# Set the default working directory
WORKDIR /opt/perforce/servers/p4root

# Start the Perforce server
ENTRYPOINT ["/usr/local/bin/p4d", "-r", "/opt/perforce/servers/p4root", "-p", "1666"]