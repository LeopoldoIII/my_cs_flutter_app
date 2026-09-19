#!/bin/bash

# Exit on severe errors
set -e

echo "===================================================="
echo "🚀 Starting Automated Setup for macOS (Flutter & Tools)"
echo "===================================================="

# 1. Homebrew Check & Install
if ! command -v brew &> /dev/null; then
    echo "📦 [1/6] Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)" 2>/dev/null || eval "$(/usr/local/bin/brew shellenv)" 2>/dev/null
else
    echo "✅ [1/6] Homebrew is already installed."
fi

# 2. Rosetta 2 Check (Apple Silicon)
if [[ $(uname -m) == 'arm64' ]]; then
    echo "🍎 [2/6] Apple Silicon detected. Ensuring Rosetta 2 is installed..."
    sudo softwareupdate --install-rosetta --agree-to-license || true
else
    echo "ℹ️  [2/6] Intel Mac detected. Skipping Rosetta 2."
fi

# 3. Xcode First Launch & License
echo "🛠️  [3/6] Setting up Xcode Command Line Tools..."
if [ -d "/Applications/Xcode.app" ]; then
    sudo xcode-select -s /Applications/Xcode.app/Contents/Developer || true
    sudo xcodebuild -runFirstLaunch || true
    sudo xcodebuild -license accept || true
else
    echo "⚠️  Xcode.app not found in /Applications. Please install Xcode from the Mac App Store."
fi

# 4. Install Formulae and Casks via Homebrew
echo "🍺 [4/6] Installing tools via Homebrew (VS Code, Android Studio, FVM, CocoaPods)..."
brew install --cask visual-studio-code || true
brew install --cask android-studio || true
brew install fvm || true
brew install cocoapods || true

# 5. Environment Variables Setup (~/.zshrc)
echo "🌐 [5/6] Configuring Environment Variables in ~/.zshrc..."
ZSHRC="$HOME/.zshrc"
touch "$ZSHRC"

add_if_missing() {
    local line="$1"
    if ! grep -Fq "$line" "$ZSHRC"; then
        echo "$line" >> "$ZSHRC"
        echo "   + Added: $line"
    fi
}

add_if_missing 'export ANDROID_HOME=$HOME/Library/Android/sdk'
add_if_missing 'export PATH=$PATH:$ANDROID_HOME/emulator'
add_if_missing 'export PATH=$PATH:$ANDROID_HOME/tools'
add_if_missing 'export PATH=$PATH:$ANDROID_HOME/tools/bin'
add_if_missing 'export PATH=$PATH:$ANDROID_HOME/platform-tools'
add_if_missing 'export PATH="$PATH:$HOME/.pub-cache/bin"'
add_if_missing 'export PATH="$PATH:$HOME/fvm/default/bin"'

# Export in current session
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$HOME/.pub-cache/bin:$HOME/fvm/default/bin

# 6. FVM & Flutter Setup
echo "💙 [6/6] Installing Flutter (Stable) via FVM..."
fvm install stable
fvm use stable

echo "===================================================="
echo "🎉 Setup Script Completed Successfully!"
echo "===================================================="
echo "📌 Next Steps:"
echo "1. Open Android Studio -> Settings -> SDK Tools -> Check 'Android SDK Command-line Tools' and click Apply."
echo "2. Run: flutter doctor --android-licenses"
echo "3. Run: fvm flutter doctor"
echo "===================================================="
