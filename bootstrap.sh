#!/bin/bash

set -euo pipefail

get_os() {
  uname
}

require_macos() {
  echo "Asserting OS is supported..."
  os="$(get_os)"
  if [ "$os" != "Darwin" ]; then
    echo "Error: Unsupported OS $os, this script only supports macOS."
    exit 1
  fi
  echo "OS $os is supported"
  echo "Proceeding with bootstrap..."
}

check_command_installed() {
  command -v "$1" >/dev/null 2>&1
}

check_brew_command_installed() {
  check_command_installed "brew"
}

install_homebrew() {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

ensure_homebrew_installed() {
  echo "Checking if Homebrew is installed..."
  if ! check_brew_command_installed; then
    echo "Homebrew is not installed"
    echo "Installing Homebrew..."
    install_homebrew
    echo "Successfully installed Homebrew"
  else
    echo "Homebrew already installed"
    echo "Skipping Homebrew install..."
  fi
}

get_brew_prefix() {
  echo "/opt/homebrew"
}

get_homebrew_shellenv_line() {
  local brew_prefix
  brew_prefix="$(get_brew_prefix)"
  echo 'eval "$('"$brew_prefix"'/bin/brew shellenv)"'
}

ensure_homebrew_shellenv_line() {
  local file="$1"
  local homebrew_shellenv_line
  homebrew_shellenv_line="$(get_homebrew_shell_env_line)"
  echo "Checking if shell profile file $file has Homebrew shellenv..."
  if [ ! -f "$file" ] || ! grep -Fxq "$homebrew_shellenv_line" "$file"; then
    echo "Appending Homebrew shellenv to shell profile file $file..."
    echo "$homebrew_shellenv_line" >> "$file"
    echo "Successfully appended Homebrew shellenv to shell profile file $file"
  else
    echo "Shell profile file $file already has Homebrew shellenv"
  fi
}

check_zsh_command_installed() {
  check_command_installed "zsh"
}

ensure_homebrew_shellenv() {
  local brew_prefix
  brew_prefix="$(get_brew_prefix)"

  echo "Configuring bash shell profile..."
  ensure_homebrew_shellenv_line "$HOME/.profile"
  echo "Successfully configured bash shell profile"

  echo "Checking if zsh shell is installed..."
  if check_zsh_command_installed; then
    echo "zsh shell is installed"
    echo "Configuring zsh shell profile..."
    ensure_homebrew_shellenv_line "$HOME/.zprofile"
    echo "Successfully configured zsh shell profile"
  else
    echo "Shell zsh is not installed"
    echo "Skipping zsh shell profile configuration"
  fi

  echo "Initializing Homebrew shell env in script..."
  eval "$("$brew_prefix/bin/brew" shellenv)"
  echo "Successfully initialized Homebrew shell env"
}

check_git_command_installed() {
  check_command_installed "git"
}

install_git() {
  brew install git
}

ensure_git_installed() {
  echo "Checking if git is installed..."
  if ! check_git_command_installed; then
    echo "git is not installed"
    echo "Installing git..."
    install_git
    echo "Successfully installed git"
  else
    echo "git already installed"
    echo "Skipping git install..."
  fi
}

bootstrap() {
  echo "Starting bootstrap..."
  require_macos
  ensure_homebrew_installed
  ensure_homebrew_shellenv
  ensure_git_installed
  echo "Bootstrap successful"
}

bootstrap
