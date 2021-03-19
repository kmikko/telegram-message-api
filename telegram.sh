#!/usr/bin/env bash

env=(
  TELEGRAM_BOT_TOKEN
  TELEGRAM_CHAT_ID
)

for i in "${env[@]}"; do
  if [ -z "${!i}" ]; then
    echo "ERROR: $i is not set, will quit..."
    exit 1
  fi
done

MESSAGE=$1
curl \
  -G -s --output /dev/null \
  --data-urlencode "chat_id=$TELEGRAM_CHAT_ID" \
  --data-urlencode "parse_mode=markdown" \
  --data-urlencode "text=$MESSAGE" \
  "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage"
