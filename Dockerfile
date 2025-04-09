# --- Stage 1: Download and install the modpack ---
FROM debian:bullseye-slim as builder

ARG MODPACK_ID=128
ARG MODPACK_VERSION=100059

ENV FTB_URL=https://api.feed-the-beast.com/v1/modpacks/public/modpack/${MODPACK_ID}/${MODPACK_VERSION}/server/linux
ENV INSTALLER_NAME=serverinstaller_${MODPACK_ID}_${MODPACK_VERSION}
ENV SERVER_DIR=/tmp/server

RUN apt-get update && \
    apt-get install -y curl unzip openjdk-17-jre-headless && \
    mkdir -p ${SERVER_DIR}

WORKDIR ${SERVER_DIR}

RUN echo "[INFO] Downloading modpack..." && \
    curl -L -o ${INSTALLER_NAME} "${FTB_URL}" && \
    chmod +x ${INSTALLER_NAME} && \
    ./${INSTALLER_NAME} --auto && \
    rm -f ${INSTALLER_NAME}

# --- Stage 2: Use itzg/minecraft-server as final image ---
FROM itzg/minecraft-server:java21-jdk

LABEL org.opencontainers.image.title="FTB OceanBlock Server"
LABEL org.opencontainers.image.description="Modded Minecraft Server ready for Docker/Unraid with persistent volume support."
LABEL org.opencontainers.image.source="https://github.com/RafaelRAzevedo/ftb-oceanblock"
LABEL org.opencontainers.image.licenses="MIT"

ENV EULA=TRUE

# Copy the installed server from builder
COPY --from=builder /tmp/server /data……

VOLUME /data

# Set the working directory
WORKDIR /data

# Start the Minecraft server
CMD ["start"]
