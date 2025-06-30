# 1. BUILDER STAGE
FROM nvidia/cuda:12.3.2-devel-ubuntu22.04 AS builder
RUN apt update && apt install -y \
    git \
    cmake \
    build-essential
WORKDIR /app
COPY . /app
RUN git submodule update --init || true
RUN mkdir -p build \
    && cd build \
    && cmake .. \
    && make -j$(nproc)


# 2. RUNTIME STAGE
FROM nvidia/cuda:12.3.2-runtime-ubuntu22.04
WORKDIR /app
RUN apt update && apt install -y libgomp1

# **ICI : supprime le mauvais dossier s'il existe**
RUN rm -rf /usr/local/bin/sha3

COPY --from=builder /app/build/sha3 /usr/local/bin/sha3
RUN chmod +x /usr/local/bin/sha3

ENTRYPOINT ["/usr/local/bin/sha3"]
