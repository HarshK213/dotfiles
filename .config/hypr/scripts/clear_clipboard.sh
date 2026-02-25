#!/bin/bash

# Clear Wayland clipboard (text + image)
wl-copy --clear

# Clear primary selection (just in case)
wl-copy --primary --clear 2>/dev/null

# Clear cliphist history
cliphist wipe

exit 0