cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
cpu_model=$(lscpu | grep "Model name" | sed 's/.*: *//')
echo "CPU Usage: $cpu_usage%"
echo "CPU Model: $cpu_model"
timestamp=$(date '+%Y-%m-%d %H:%M:%S')
echo "[$timestamp] - Core Usage [$cpu_usage%] - Terminal Model [$cpu_model]" >> ./core.log
