#!/bin/bash

# exit if we arent running on OSX
uname -a | grep -q Darwin || exit 0

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'


## UI/UX

# Menu bar
defaults write com.apple.systemuiserver menuExtras '
(
  "/System/Library/CoreServices/Menu Extras/Clock.menu",
  "/System/Library/CoreServices/Menu Extras/Battery.menu",
  "/System/Library/CoreServices/Menu Extras/AirPort.menu",
  "/System/Library/CoreServices/Menu Extras/Bluetooth.menu",
  "/System/Library/CoreServices/Menu Extras/Volume.menu"
)'



## Dock

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# mission control
# disables auto rearrange based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# changes screenshot location
defaults write com.apple.screencapture location -string "$HOME/Documents/ScreenShots"



## restart affected services
for app in \
  "Touch Bar agent" \
  "ControlStrip" \
  "SystemUIServer" \
  "cfprefsd"; do
  pkill "${app}" &> /dev/null
done
