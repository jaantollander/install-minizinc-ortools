#!/bin/bash
UBUNTU_VERSION="20.04"
VERSION="9.1"
REV="9490"
ORT_DIR="or-tools_amd64_flatzinc_ubuntu-${UBUNTU_VERSION}_v${VERSION}.${REV}"
ARCHIVE="${ORT_DIR}.tar.gz"

INSTALL_DIR="$HOME/bin"
CONF_DIR="$HOME/.minizinc/solvers"

## Create the installation directory if it does not exist
mkdir -p $INSTALL_DIR

## Download OR-Tools release
wget "https://github.com/google/or-tools/releases/download/v${VERSION}/${ARCHIVE}" \
    -O "${INSTALL_DIR}/${ARCHIVE}"

## Extract the binaries from archive
tar -xzvf "${INSTALL_DIR}/${ARCHIVE}" -C "${INSTALL_DIR}"

## Remove extracted archive
rm "${INSTALL_DIR}/${ARCHIVE}"

## Create directory for the solver configuration file
mkdir -p $CONF_DIR

## Create a solver configuration files
echo "{\
\"id\": \"com.google.or-tools\", \
\"name\": \"OR-Tools\", \
\"description\": \"OR Tools Constraint Programming Solver (from Google)\", \
\"version\": \"${VERSION}.${REV}\", \
\"executable\": \"${INSTALL_DIR}/or-tools_flatzinc_Ubuntu-${UBUNTU_VERSION}-64bit_v${VERSION}.${REV}/bin/fzn-or-tools\", \
\"tags\": [\"cp\",\"int\", ], \
\"stdFlags\": [\"-a\",\"-n\",\"-s\",\"-v\",\"-p\",\"-f\",\"-t\"], \
\"supportsMzn\": false, \
\"supportsFzn\": true, \
\"needsSolns2Out\": true, \
\"needsMznExecutable\": false, \
\"needsStdlibDir\": false, \
\"isGUIApplication\": false \
}" >> ${CONF_DIR}/or-tools.msc
