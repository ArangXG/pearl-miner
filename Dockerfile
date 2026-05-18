FROM nvidia/cuda:12.1.0-base-ubuntu22.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    libgomp1 \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Copy binary
COPY pearl-miner /usr/local/bin/pearl-miner
RUN chmod +x /usr/local/bin/pearl-miner

# Default command
CMD ["/usr/local/bin/pearl-miner"]
