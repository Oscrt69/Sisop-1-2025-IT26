function CPU {
  if crontab -l | grep -q "core_monitor.sh"; then
    echo -e "Cpu is already monitored"
    return 1
  fi
  local script="$(pwd)/scripts/core_monitor.sh"
  local schedule='* * * * *'
  (crontab -l; echo "$schedule $script") | crontab - 2>/dev/null

  echo -e "Added Successfully"
}


function RAM {
  if crontab -l | grep -q "frag_monitor.sh"; then
    echo -e "Ram is already monitored"
    return 1
  fi
  local script="$(pwd)/scripts/frag_monitor.sh"
  local schedule='* * * * *'
  (crontab -l; echo "$schedule $script") | crontab - 2>/dev/null

  echo -e "Added Successfully"
}

function removeCPU {
  if ! crontab -l | grep -q "core_monitor.sh"; then
    echo -e "Cpu is not monitored yet"
    return 1
  fi
  crontab -l | grep -v "core_monitor.sh" | crontab -

  echo -e "Removed Successfully"
}

function removeRAM {
  if ! crontab -l | grep -q "frag_monitor.sh"; then
    echo -e "Ram is not monitored yet"
    return 1
  fi
  crontab -l | grep -v "frag_monitor.sh" | crontab -

  echo -e "Removed Successfully"
}

function viewCrontab {
  if [ -z "$(crontab -l)" ]; then
    echo "No scheduled monitoring jobs"
  else
    crontab -l
  fi
}

# Menu utama
while true; do
  username=$(echo $SESSION | cut -d ',' -f2)
  echo "1. Add CPU - Core Monitor to Crontab"
  echo "2. Add RAM Fragment Monitor to Crontab"
  echo "3. Remove CPU - Core Monitor from Crontab"
  echo "4. Remove RAM Fragment Monitor from Crontab"
  echo "5. View All Scheduled Monitoring Jobs"
  echo "6. Exit"
  read -p "Choose an option: " choice

  case $choice in
    1) CPU ;;
    2) RAM ;;
    3) removeCPU ;;
    4) removeRAM ;;
    5) viewCrontab ;;
    6) exit 0 ;;
    *) echo -e "Invalid!" ;;
  esac
done

