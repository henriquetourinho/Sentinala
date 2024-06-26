#!/bin/bash

# Configurações
CPU_LIMIT=70
TELEGRAM_TOKEN="TOKEN"
TELEGRAM_CHAT_ID="ID"
LOG_FILE="./monitor_sistema.log"

# Função de log
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

# Função para enviar mensagem no Telegram
send_telegram() {
    MESSAGE=$1
    curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_TOKEN/sendMessage" -d chat_id="$TELEGRAM_CHAT_ID" -d text="$MESSAGE"
}

# Monitorar CPU
monitor_cpu() {
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    if (( $(echo "$CPU_USAGE > $CPU_LIMIT" | bc -l) )); then
        log "Alerta: Uso de CPU alto - $CPU_USAGE%"
        MESSAGE="Alerta: Uso de CPU alto - $CPU_USAGE%"
        send_telegram "$MESSAGE"
    fi
}

# Detectar conexões suspeitas
monitor_connections() {
    SUSPECT_CONNECTIONS=$(netstat -an | grep -E '22|23|3389' | wc -l)
    if [ "$SUSPECT_CONNECTIONS" -gt 0 ]; then
        log "Alerta: Conexões suspeitas detectadas - $SUSPECT_CONNECTIONS conexões"
        MESSAGE="Alerta: Conexões suspeitas detectadas - $SUSPECT_CONNECTIONS conexões"
        send_telegram "$MESSAGE"
    fi
}

# Executar monitoramento de CPU e conexões
monitor_cpu
monitor_connections

log "Monitoramento concluído."

exit 0
