#!/usr/bin/env bash
set -euo pipefail

# Usage: ./increment.sh [start] [delay_seconds] [step] [max]
# Examples:
#   ./increment.sh          # start=1, delay=1s, step=1, infinite
#   ./increment.sh 0 0.5 2 10
start=${1:-1}
delay=${2:-1}
step=${3:-1}
max=${4:-}

i=$start
while true; do
  printf '%s\n' "$i"
  if [[ -n "$max" ]]; then
    if (( step >= 0 && i >= max )) || (( step < 0 && i <= max )); then
      break
    fi
  fi
  (( i += step ))
  sleep "$delay"
done
