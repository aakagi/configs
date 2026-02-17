### Download apps

- Sign in to 1password
- Sign in to Chrome
- https://karabiner-elements.pqrs.org/
- https://www.raycast.com/

### Clone repo

```
# It will prompt to install xcode / git on initial run.
git --version

mkdir -p ~/aakagi && git clone git@github.com:aakagi/configs.git
```


### System Settings

```
Trackpad
  Tracking speed: 5
  Click: Light
  Look up & data detectors: Off
  Secondary click: Click in Bottom Left Corner
  Tap to click: On

Accessibility
  Pointer Control
    Trackpad Options...
      Use trackpad for dragging: On
      Dragging style: Three Finger Drag

General
  Local hostname: Edit

Desktop & Dock
  Automatically hide and show the Dock: On
  Animate opening applications: Off
  Show suggested and recent apps in Dock: Off
  # Prevents behavior where switching between workspaces causes nothing to be in focus.
  Mission Control
    Displays have separate Spaces: Off
  Actual Dock (not in system preferences)
    Remove all apps
    Size: Make smaller (no units)

Displays
  Automatically adjust brightness: Off

Keyboard
  Keyboard shortcuts
    Screenshots: Swap save / copy commands for *3 and *4
    Services
      Searching
        Look Up in Dictionary: Off
        Search with Google: Off
  Text Input
    Input Sources: Edit
      Correct spelling automatically: Off
      Capitalize words automatically: Off
      Show inline predictive text: Off
      Show suggested replies: Off
      Add period with double-space: Off
    Text Replacements
      Remove "omw"
  Terminal:
    # Disable emoji suggestions
    sudo defaults write /Library/Preferences/FeatureFlags/Domain/UIKit.plist emoji_enhancements -dict-add Enabled -bool NO

Control Center (in menu bar)
  Bluetooth: Add to Menu Bar
```


### ZDOTDIR

```zsh
# Execute this script to link to this repo's zdotdir
./zdotdir/link.sh
```

#### Load order

```
# > zsh -l
.zshenv → .zprofile → .zshrc → .zlogin → .zlogout

→ ~/.zshenv
→ /etc/zprofile
→ /etc/zshrc
→ /etc/zshrc_Apple_Terminal
→ ~/.zshrc
```
