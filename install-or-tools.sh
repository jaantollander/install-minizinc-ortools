#!/bin/bash
UBUNTU_VERSION="20.04"
VERSION="9.1"
REV="9490"
ORT_DIR="or-tools_amd64_flatzinc_ubuntu-${UBUNTU_VERSION}_v${VERSION}.${REV}"
ARCHIVE="${ORT_DIR}.tar.gz"

# Download OR-Tools release
wget "https://github.com/google/or-tools/releases/download/v${VERSION}/${ARCHIVE}" \
    -O "$HOME/bin/${ARCHIVE}"

# Extract the binaries from archive
tar -xzvf "$HOME/bin/${ARCHIVE}" -C "$HOME/bin"

# Remove extracted archive
rm "$HOME/bin/${ARCHIVE}"

# Create a solver configuration file to
# `$HOME/.minizinc/solvers/or-tools.msc`
mkdir -p "$HOME/.minizinc/"
mkdir -p "$HOME/.minizinc/solvers"
echo "{\
\"id\": \"com.google.or-tools\", \
\"name\": \"OR-Tools\", \
\"description\": \"OR Tools Constraint Programming Solver (from Google)\", \
\"version\": \"${VERSION}.${REV}\", \
\"executable\": \"${HOME}/bin/or-tools_flatzinc_Ubuntu-${UBUNTU_VERSION}-64bit_v${VERSION}.${REV}/bin/fzn-or-tools\", \
\"tags\": [\"cp\",\"int\", ], \
\"stdFlags\": [\"-a\",\"-n\",\"-s\",\"-v\",\"-p\",\"-f\",\"-t\"], \
\"supportsMzn\": false, \
\"supportsFzn\": true, \
\"needsSolns2Out\": true, \
\"needsMznExecutable\": false, \
\"needsStdlibDir\": false, \
\"isGUIApplication\": false \
}" >> $HOME/.minizinc/solvers/or-tools.msc
