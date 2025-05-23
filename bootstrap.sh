#!/bin/sh

set -oue

main() {

    # Check if running in Homebrew install context
    if [ -z "${HOMEBREW_FORMULA_PREFIX:-}" ]; then
        # Not running during Homebrew install

        # Install Homebrew if not present
        if ! command -v brew >/dev/null 2>&1; then
            echo "Homebrew not found. Installing Homebrew..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            eval "$(/opt/homebrew/bin/brew shellenv)" 2>/dev/null || \
            eval "$(/usr/local/bin/brew shellenv)"
        fi

        # Tap adelynnmckay/tap if not already tapped
        if ! brew tap | grep -q '^adelynnmckay/tap$'; then
            echo "Tapping adelynnmckay/tap..."
            brew tap adelynnmckay/tap
        fi

        # Install bootstrap.sh if not already installed
        if ! brew list --formula | grep -q '^bootstrap.sh$'; then
            echo "Installing bootstrap.sh..."
            brew install adelynnmckay/tap/bootstrap.sh
        fi

        # Build current formula from source
        formula_file="./Formula/$(basename "$(pwd)").rb"
        if [ -f "$formula_file" ]; then
            echo "Installing formula from $formula_file..."
            brew install --build-from-source "$formula_file"
        else
            echo "Error: Formula file not found: $formula_file" >&2
            exit 1
        fi
    fi

}

main
