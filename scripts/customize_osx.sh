#!/bin/bash

# exit if we aren't running on OSX
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

# Show battery percentage
defaults write com.apple.menuextra.battery ShowPercent -bool true

# Disable automatic capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# disable automatic period substitution
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# clock settings
defaults write com.apple.menuextra.clock IsAnalog -bool false
defaults write com.apple.menuextra.clock DateFormat -string "EEE MMM d  H:mm"

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
  "Dock" \
  "ControlStrip" \
  "SystemUIServer" \
  "cfprefsd"; do
  pkill "${app}" &> /dev/null
done
