DIR_PATH=$(realpath $(dirname $0))
LOG_DIR=$(realpath "$DIR_PATH/../logs")

if [ ! -d "$LOG_DIR" ]; then
    mkdir -p "$LOG_DIR"
fi

CPU_Load=$(top -bn2 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}' | awk 'NR==2 {print $0}' )
CPU_Type=$(lscpu | grep 'Model name' | awk -F': ' '{print $2}' | xargs)

echo "[$(date +'%Y-%m-%d %H:%M:%S')] - Core Usage [$CPU_Load] - Terminal Model [$CPU_Type]" >> "$LOG_DIR/core.log"

