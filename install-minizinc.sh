#!/bin/bash
MZN_VERSION="2.5.5"
MZN_DIR="MiniZincIDE-${MZN_VERSION}-bundle-linux-x86_64"
MZN_ARCHIVE="${MZN_DIR}.tgz"

# Download MiniZinc release
wget "https://github.com/MiniZinc/MiniZincIDE/releases/download/${MZN_VERSION}/${MZN_ARCHIVE}" \
     -O "$HOME/bin/${MZN_ARCHIVE}"

# Extract the binaries from archive
tar xf "$HOME/bin/${MZN_ARCHIVE}" -C "$HOME/bin"

# Remove extracted directory
rm "$HOME/bin/${MZN_ARCHIVE}"

# Create path environment variables
export PATH=$HOME/bin/${MZN_DIR}/bin:$PATH
export LD_LIBRARY_PATH=$HOME/bin/${MZN_DIR}/lib:$LD_LIBRARY_PATH
export QT_PLUGIN_PATH=$HOME/bin/${MZN_DIR}/plugins:$QT_PLUGIN_PATH
