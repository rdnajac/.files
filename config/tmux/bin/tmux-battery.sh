#!/bin/bash

# Get the battery percentage as a number (remove the % sign)
battery_percent=$(pmset -g batt | grep -o "[0-9]\{1,3\}%" | tr -d '%')

# Get the charging status
charging_status=$(pmset -g batt | grep "AC Power")

if [ -n "$charging_status" ]; then
    icon=" "
elif [ "$battery_percent" -eq 100 ]; then
    icon="🔌"
elif [ "$battery_percent" -le 20 ]; then
    icon="🪫"
else
    icon="🔋"
fi

# Print the icon, battery percentage, and optional lightning bolt
printf "%s%d%%\n" "$icon" "$battery_percent"
