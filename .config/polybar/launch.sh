#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config.
polybar main &
# (Bạn có thể thay đổi "example" thành tên bar mà bạn định nghĩa trong file config của Polybar)

echo "Polybar launched..."
