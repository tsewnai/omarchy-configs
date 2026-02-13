#!/usr/bin/bash
# Move active window to workspace 4 (DP-7) and place on right half
hyprctl dispatch movetoworkspace 4

# Get DP-7 monitor geometry
MON=$(hyprctl monitors -j | jq '.[] | select(.name == "DP-7")')
MON_X=$(echo "$MON" | jq '.x')
MON_Y=$(echo "$MON" | jq '.y')
MON_W=$(echo "$MON" | jq '.width')
MON_H=$(echo "$MON" | jq '.height')
BAR_H=$(echo "$MON" | jq '.reserved[1]')

# Gap settings (gaps_in between windows, gaps_out from monitor edge)
GAPS_IN=5
GAPS_OUT=5

# Right half position and size, matching tiled window gaps
WIN_X=$((MON_X + MON_W / 2 + GAPS_IN))
WIN_Y=$((MON_Y + BAR_H + GAPS_OUT))
WIN_W=$((MON_W / 2 - GAPS_IN - GAPS_OUT))
WIN_H=$((MON_H - BAR_H - GAPS_OUT * 2))

# Float the window if not already floating
FLOATING=$(hyprctl activewindow -j | jq -r '.floating')
if [ "$FLOATING" != "true" ]; then
    hyprctl dispatch togglefloating
fi

# Size and position on right half
hyprctl dispatch resizewindowpixel "exact $WIN_W $WIN_H, activewindow"
hyprctl dispatch movewindowpixel "exact $WIN_X $WIN_Y, activewindow"
