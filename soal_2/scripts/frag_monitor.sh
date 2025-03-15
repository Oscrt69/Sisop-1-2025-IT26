ram_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
ram_total=$(free -m | grep Mem | awk '{print $2}')
ram_used=$(free -m | grep Mem | awk '{print $3}')
ram_available=$(free -m | grep Mem | awk '{print $7}')
timestamp=$(date '+%Y-%m-%d %H:%M:%S')

echo "[$timestamp] - Fragment Usage [$ram_usage%] - Fragment Count [$ram_used MB] - Details [Total: $ram_total MB, Available: $ram_available MB]" >> ./logs/fragment.log
