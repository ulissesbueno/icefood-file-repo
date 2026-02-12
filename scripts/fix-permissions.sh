#!/bin/bash

# Script para corrigir permissões automaticamente
UPLOAD_DIR="/data/uploads"

# Corrigir ownership e permissões para nginx conseguir ler
find "$UPLOAD_DIR" -type f -exec chmod 644 {} \;
find "$UPLOAD_DIR" -type d -exec chmod 755 {} \;

# Log da execução
echo "$(date): Permissões corrigidas em $UPLOAD_DIR"
