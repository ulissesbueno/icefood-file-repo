#!/bin/bash

# --- Configurações fixas ---
FTP_HOST="172.235.32.55"
FTP_USER="agoradelivey"
FTP_PASS="X9rA4vT7kJ2mQ6bP"
REMOTE_DIR=""

# --- Verifica se o parâmetro foi informado ---
if [ -z "$1" ]; then
  echo "❌ Uso: ./upload.sh /caminho/do/arquivo.ext"
  exit 1
fi

LOCAL_FILE="$1"

# --- Verifica se o arquivo existe ---
if [ ! -f "$LOCAL_FILE" ]; then
  echo "❌ Arquivo não encontrado: $LOCAL_FILE"
  exit 1
fi

# --- Executa o upload ---
echo "🚀 Enviando '$LOCAL_FILE' para ftp://$FTP_HOST$REMOTE_DIR/"
echo "🔍 Testando conexão FTP..."

# Teste de conectividade primeiro
curl --user "$FTP_USER:$FTP_PASS" "ftp://$FTP_HOST/" --list-only --connect-timeout 10 -v

echo "📤 Iniciando upload..."
curl -T "$LOCAL_FILE" --user "$FTP_USER:$FTP_PASS" "ftp://$FTP_HOST$REMOTE_DIR/" --ftp-create-dirs -v --progress-bar

# --- Resultado ---
if [ $? -eq 0 ]; then
  echo "✅ Upload concluído com sucesso!"
else
  echo "⚠️ Falha no upload."
fi
