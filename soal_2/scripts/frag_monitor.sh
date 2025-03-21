DIR_PATH=$(realpath $(dirname $0))
LOG_DIR=$(realpath "$DIR_PATH/../logs")

if [ ! -d "$LOG_DIR" ]; then
    mkdir -p "$LOG_DIR"
fi

echo "[$(date "+%Y-%m-%d %H:%M:%S")] - Fragment Usage [$(awk '/MemFree/ {free=$2} /MemTotal/ {total=$2} END {print (1 - free/total) * 100}' /proc/meminfo)%] - Fragment Count [$(awk '/SReclaimable/ {print $2/1024}' /proc/meminfo) MB] - Details [Total: $(free -m | awk '/Mem:/ {print $2}') MB, Available: $(free -m | awk '/Mem:/ {print $7}') MB]" >> "$LOG_DIR/fragment.log"
