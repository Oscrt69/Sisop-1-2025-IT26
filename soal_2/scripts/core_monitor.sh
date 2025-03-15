cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
cpu_model=$(lscpu | grep "Model name" | cut -d ':' -f 2 | xargs)
timestamp=$(date '+%Y-%m-%d %H:%M:%S')
echo "[$timestamp] - Core Usage [$cpu_usage%] - Terminal Model [$cpu_model]" >> ./logs/core.log
