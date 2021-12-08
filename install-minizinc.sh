#!/bin/bash
MZN_VERSION="2.5.5"
MZN_DIR="MiniZincIDE-${MZN_VERSION}-bundle-linux-x86_64"
MZN_ARCHIVE="${MZN_DIR}.tgz"

INSTALL_DIR="$HOME/bin"

## Create the installation directory if it does not exist
mkdir -p $INSTALL_DIR

## Download MiniZinc release
wget "https://github.com/MiniZinc/MiniZincIDE/releases/download/${MZN_VERSION}/${MZN_ARCHIVE}" \
     -O "${INSTALL_DIR}/${MZN_ARCHIVE}"

## Extract the binaries from archive
tar xf "${INSTALL_DIR}/${MZN_ARCHIVE}" -C "${INSTALL_DIR}"

## Remove extracted directory
rm "${INSTALL_DIR}/${MZN_ARCHIVE}"

## Create path environment variables to .bashrc
echo "export PATH=${INSTALL_DIR}/${MZN_DIR}/bin:\$PATH" >> $HOME/.bashrc

## Uncomment the following lines if you want to use the MiniZinc GUI
# echo "export LD_LIBRARY_PATH=${INSTALL_DIR}/${MZN_DIR}/lib:\$LD_LIBRARY_PATH" >> $HOME/.bashrc
# echo "export QT_PLUGIN_PATH=${INSTALL_DIR}/${MZN_DIR}/plugins:\$QT_PLUGIN_PATH" >> $HOME/.bashrc
