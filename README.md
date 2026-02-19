### Setup

- Sign in to Chrome
- Sign in to 1password
  - [Download chrome extension](https://1password.com/downloads/browser-extension)
- Sign in to Github
- [Karabiner Elements](https://karabiner-elements.pqrs.org/)
- [Raycast](https://www.raycast.com/)

```zsh
## Terminal setup

# It will prompt to install xcode / git on initial run.
git --version

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Github CLI
brew install gh

# Disable emoji suggestions
sudo defaults write /Library/Preferences/FeatureFlags/Domain/UIKit.plist emoji_enhancements -dict-add Enabled -bool NO
```

```
Terminal (app)
  Preferences
    Profiles
      Sidebar (theme)
        Basic: "Default"
      Keyboard
        Use option key as meta key: On

Control Center (in menu bar)
  Bluetooth: Add to Menu Bar
```

```zsh
## Config script setup

git config --global user.name "Alex Akagi"
git config --global user.email "alex@akagi.co"
ssh-keygen -t ed25519 -C "alex@akagi.co"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Add new SSH key https://github.com/settings/ssh/new
pbcopy < ~/.ssh/id_ed25519.pub

# Test the connection
ssh -T git@github.com

# Clone and go to this dir
mkdir -p ~/aakagi && cd ~/aakagi && git clone git@github.com:aakagi/configs.git && cd configs
```

```zsh
# Link zsh configs
./zdotdir/link.sh

# Link Karabiner
mkdir -p ~/.config/karabiner && ln -si $(pwd)/karabiner.json ~/.config/karabiner/karabiner.json

# Link VS Code settings
./vscode/link.sh
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

Lock Screen
  Turn display off on battery when inactive: For 10 minutes
```


#### Zsh Load order

```
# > zsh -l
.zshenv → .zprofile → .zshrc → .zlogin → .zlogout

→ ~/.zshenv
→ /etc/zprofile
→ /etc/zshrc
→ /etc/zshrc_Apple_Terminal
→ ~/.zshrc
```

### Apps

#### VS Code

