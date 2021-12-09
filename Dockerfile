FROM minizinc/minizinc:2.5.5-bionic AS BUILDER

# OR-Tools version and revision
ARG VERSION="9.1"
ARG REV="9490"

# Archive file for downloading OR-Tools
ARG ARCHIVE="or-tools_amd64_flatzinc_ubuntu-18.04_v${VERSION}.${REV}.tar.gz"

# Name of the directory inside the archive
ARG ORT_DIR="or-tools_flatzinc_Ubuntu-18.04-64bit_v${VERSION}.${REV}"

# Install temporary dependencies
RUN apt-get update
RUN apt-get install wget -y

# Download OR-Tools Release
RUN echo "Yass $VERSION"
RUN wget https://github.com/google/or-tools/releases/download/v${VERSION}/${ARCHIVE}
RUN tar -xzvf ${ARCHIVE}

# Setup Binary files
RUN mkdir /ortools
RUN ls -lah
RUN mv ${ORT_DIR}/bin ${ORT_DIR}/lib /ortools

# Setup OR-Tools MiniZinc library
RUN mkdir -p /ortools/share/minizinc/ortools
RUN mv ${ORT_DIR}/share/minizinc/* /ortools/share/minizinc/ortools/

# Add OR-Tools solver configuration
RUN mkdir -p /ortools/share/minizinc/solvers
RUN echo "{ \n\
    \"id\": \"com.google.or-tools\",\n\
    \"name\": \"OR-Tools\",\n\
    \"description\": \"OR Tools Constraint Programming Solver (from Google)\",\n\
    \"version\": \"${VERSION}.${REV}\",\n\
    \"mznlib\": \"-Gortools\",\n\
    \"executable\": \"../../../bin/fzn-or-tools\",\n\
    \"tags\": [\"cp\",\"int\", ],\n\
    \"stdFlags\": [\"-a\",\"-n\",\"-s\",\"-v\",\"-p\",\"-f\",\"-t\"],\n\
    \"supportsMzn\": false,\n\
    \"supportsFzn\": true,\n\
    \"needsSolns2Out\": true,\n\
    \"needsMznExecutable\": false,\n\
    \"needsStdlibDir\": false,\n\
    \"isGUIApplication\": false \n\
    }" >> /ortools/share/minizinc/solvers/or-tools.msc

# Set OR-Tools as default MiniZinc solver
RUN sed 's/org\.gecode\.gecode/com\.google\.or-tools/g' /usr/local/share/minizinc/Preferences.json > /ortools/share/minizinc/Preferences.json

FROM minizinc/minizinc:2.5.5-bionic

COPY --from=BUILDER /ortools/ /usr/local/