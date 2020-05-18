#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Make ZSH the default shell environment
chsh -s $(which zsh)

# Set zsh and oh-my-zsh preferences


# Create a Code directory
mkdir $HOME/Code

# Install vscodium and iterm 2
brew cask install vscodium
brew cask install iterm2

codesign --sign - --force --deep /Applications/VSCodium.app # Stops MacOS being daft about opening vscodium
xattr -d com.apple.quarantine /Applications/VSCodium.app 

# Install Slack and Signal
brew cask install slack
brew cask install signal

# Set OS X preferences
# We will run this last because this will reload the shell
source .osx
