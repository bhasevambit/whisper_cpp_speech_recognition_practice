# Whisper.cpp Speech-Recognition Training

This repository is Whisper.cpp Speech-Recognition Training Test Code.

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

## Note

- This repository is used below commands. Please install below commands.

  - `make`
  - `gcc`
  - `g++`

- When using a **Windows**, Whisper.cpp is not easy to install. Therefore, I recommend using openai/whisper.
