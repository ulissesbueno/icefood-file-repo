#!/bin/bash
# Remove arquivos com mais de X horas

TARGET_DIR="/data/uploads"
EXPIRE_HOURS=${EXPIRE_HOURS:-24}
EXPIRE_MINUTES=$((EXPIRE_HOURS * 60))

echo "🧹 Limpando arquivos com mais de $EXPIRE_HOURS horas em $TARGET_DIR..."
find "$TARGET_DIR" -type f -mmin +$EXPIRE_MINUTES -delete
echo "✔️ Limpeza concluída em $(date)"
