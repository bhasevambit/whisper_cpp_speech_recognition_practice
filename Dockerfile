# --- Base Image pull from DockerHub ---
FROM ubuntu:latest

# --- Shell & ENV Setting ---
SHELL ["/bin/bash", "-c"]
ENV HOME /root

# --- Host Files Copy ---
COPY share/ ${HOME}/Host_shared/

# --- OS Package Update ---
RUN apt update

# --- OS Package upgrade ---
RUN apt upgrade -y

# --- OS Timezone Setting ---
RUN apt install -y tzdata
ENV TZ=Asia/Tokyo

# --- OS Basic Package Install ---
RUN apt install -y vim git wget

# --- C/C++ Development Tools Install ---
RUN apt install -y build-essential cmake

# --- Other Package Install ---
RUN apt install -y ffmpeg

# --- whisper.cpp Library Install ---
RUN git clone https://github.com/ggerganov/whisper.cpp.git

# --- whisper.cpp Model Download ---
RUN ./whisper.cpp/models/download-ggml-model.sh tiny
RUN ./whisper.cpp/models/download-ggml-model.sh base
RUN ./whisper.cpp/models/download-ggml-model.sh small

# --- whisper.cpp Compile codes ---
RUN cd ./whisper.cpp && make
