FROM openjdk:21-jdk-slim

WORKDIR /data

COPY . /data

RUN chmod +x run.sh

ENV EULA=true
ENV MEMORY=4G
ENV JVM_OPTS=""

VOLUME ["/data"]
EXPOSE 25565

CMD ["bash", "./run.sh"]
