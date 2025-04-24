#!/bin/bash

# Defina os parâmetros
ARQUIVO_ENTRADA="src/assets/video/video_universe.mp4"  # Caminho do vídeo original
ARQUIVO_SAIDA="src/assets/video/video_universe_cortado.mp4"  # Caminho do vídeo cortado
TEMPO_INICIO="00:00:00"  # Tempo de início para o corte (formato HH:MM:SS)
DURACAO="00:00:03"  # Duração do corte (formato HH:MM:SS)

# Comando para cortar o vídeo
ffmpeg -i "$ARQUIVO_ENTRADA" -ss "$TEMPO_INICIO" -t "$DURACAO" -c:v libx264 -c:a aac -strict experimental "$ARQUIVO_SAIDA"

echo "Vídeo cortado com sucesso! O arquivo cortado é: $ARQUIVO_SAIDA"
