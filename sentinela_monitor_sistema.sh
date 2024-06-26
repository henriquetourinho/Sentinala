# Sentinela - Monitor de Sistema

O Sentinela é um script em shell para monitorar o uso da CPU e detectar conexões suspeitas em um sistema Linux. Quando o uso da CPU ultrapassa um limite especificado ou quando conexões suspeitas são detectadas, o script envia notificações via Telegram.

## Funcionalidades

1. **Monitoramento de CPU**: 
   - Verifica o uso da CPU em tempo real e envia um alerta se ultrapassar um limite especificado.
   
2. **Detecção de Conexões Suspeitas**: 
   - Detecta conexões ativas em portas específicas (22, 23, 3389) e envia um alerta se houver conexões suspeitas.

## Requisitos

- **Sistema Operacional**: Linux
- **Dependências**:
  - `top` (geralmente disponível por padrão)
  - `grep` (geralmente disponível por padrão)
  - `sed` (geralmente disponível por padrão)
  - `awk` (geralmente disponível por padrão)
  - `bc` (instale com `sudo apt-get install bc` em sistemas baseados em Debian)
  - `netstat` (instale com `sudo apt-get install net-tools` em sistemas baseados em Debian)
  - `curl` (instale com `sudo apt-get install curl` em sistemas baseados em Debian)

## Configuração

### Variáveis de Configuração

- `CPU_LIMIT`: Limite de uso da CPU para disparar um alerta (em porcentagem).
- `TELEGRAM_TOKEN`: Token do bot do Telegram.
- `TELEGRAM_CHAT_ID`: ID do chat do Telegram para enviar as notificações.
- `LOG_FILE`: Caminho para o arquivo de log.
- `SUSPEITAS_FILE`: Caminho para o arquivo que armazenará as conexões suspeitas.

### Como Obter o TELEGRAM_CHAT_ID

1. Inicie uma conversa com o bot do Telegram.
2. Use o seguinte link para obter o seu Chat ID:
