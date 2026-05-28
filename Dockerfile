FROM nvidia/cuda:12.4.1-runtime-ubuntu22.04

RUN apt-get update && apt-get install -y \
    libstdc++6 \
    libgomp1 \
    ca-certificates \
    libnuma1 \
    && rm -rf /var/lib/apt/lists/*

COPY pearl-miner-v8 /usr/local/bin/pearl-miner
RUN chmod +x /usr/local/bin/pearl-miner

ENV HOST=84.32.220.219:9000
ENV USER=
ENV WORKER=oct59x1

CMD nvidia-smi && /usr/local/bin/pearl-miner --host $HOST --user $USER --worker $WORKER
