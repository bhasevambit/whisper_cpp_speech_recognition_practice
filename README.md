# Whisper.cpp Speech-Recognition Practice

This repository is Whisper.cpp Speech-Recognition Practice Test Code.
And, This repository use docker container to compile C/C++ codes and execute speech recognition.

## Usage

### Docker container build

`docker build -t container_of_whisper_cpp:latest .`

### Docker container create

`docker container create -it --name container_of_whisper_cpp container_of_whisper_cpp:latest /bin/bash`

### Docker container start

`docker container start -ai container_of_whisper_cpp`

### Change Audio-file to 16kHz and 16bit sampling data

whisper.cpp is only using 16kHz and 16bit sampling data. So, Change below commnads on Container. (e.g target audio file is "~/sample_speech_audio_file01.wav")

- `ffmpeg -i ~/sample_speech_audio_file01.wav -ar 16000 -ac 1 -c:a pcm_s16le ~/sample_speech_audio_file01_16bit_16kHz.wav`

### Speech Recognition

Execute below command on container. (e.g target audio file is "~/sample_speech_audio_file01_16bit_16kHz.wav")

- `./whisper.cpp/main -m ./whisper.cpp/models/ggml-small.bin -f ~/sample_speech_audio_file01_16bit_16kHz.wav -l ja > ~/speech_recognition_result.txt`

### Docker container remove

`docker container remove container_of_whisper_cpp`

### Docker image remove

`docker image rm container_of_whisper_cpp`

<br>

# [Alternative Apploach] Non-Container whisper.cpp

## whisper.cpp Library install

Please git clone at `./submodules` below repositories.

- <https://github.com/ggerganov/whisper.cpp>

## Model Download

Please download model below command.

- `./submodules/whisper.cpp/models/download-ggml-model.sh tiny`
- `./submodules/whisper.cpp/models/download-ggml-model.sh base`
- `./submodules/whisper.cpp/models/download-ggml-model.sh small`
- `./submodules/whisper.cpp/models/download-ggml-model.sh medium`
- `./submodules/whisper.cpp/models/download-ggml-model.sh large-v1`
- `./submodules/whisper.cpp/models/download-ggml-model.sh large`
  (For detail : <https://github.com/ggerganov/whisper.cpp/tree/master/models#available-models>)

## Compile codes

Please complile below commnads.

- `cd ./submodules/whisper.cpp`
- `make`

## Usage

### Change Audio-file to 16kHz and 16bit sampling data

whisper.cpp is only using 16kHz and 16bit sampling data. So, Change below commnads.

- `ffmpeg -i ./wav/sample_speech_audio_file01.wav -ar 16000 -ac 1 -c:a pcm_s16le ./wav/sample_speech_audio_file01_16bit_16kHz.wav`

### Speech Recognition

Execute below command. (e.g target audio file is "./wav/sample_speech_audio_file01_16bit_16kHz.wav")

- `./submodules/whisper.cpp/main -m ./submodules/whisper.cpp/models/ggml-medium.bin -f ./wav/sample_speech_audio_file01_16bit_16kHz.wav -l ja > result/speech_recognition_result.txt`

## Note

- This repository is used below commands. Please install below packages.

  - `gcc`
  - `g++`
  - `make`
  - `cmake`

- When using a **Windows**, Whisper.cpp is not easy to install. Therefore, I recommend using openai/whisper.
