#!/bin/bash

LOG_FILE="$(dirname "$0")/logs/health.log"
SERVER_IP="1.1.1.1"

mkdir -p "$(dirname "$LOG_FILE")"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

check_disk() {
    local usage
    usage=$(df -P / | awk 'NR==2 {gsub("%","",$5); print $5}')

    log "Disk usage: ${usage}%"

    if (( usage >= 80 )); then
        log "WARNING: Disk usage is high!"
    fi
}

check_memory() {
    local usage
    usage=$(free | awk '/Mem:/ {printf "%.0f", $3/$2*100}')

    log "Memory usage: ${usage}%"

    if (( usage >= 80 )); then
        log "WARNING: Memory usage is high!"
    fi
}

check_network() {
    if ping -c 1 -W 2 "$SERVER_IP" >/dev/null 2>&1; then
        log "Network connectivity: OK ($SERVER_IP)"
    else
        log "WARNING: Cannot reach $SERVER_IP"
    fi
}

log "===== Health check started ====="
log "Hostname: $(hostname)"
log "System uptime: $(uptime -p)"
check_disk
check_memory
check_network
log "===== Health check completed ====="
