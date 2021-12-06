# Scripts for Installing MiniZinc and OR-Tools on Linux
These scripts are tested on Ubuntu 20.04. They can be modified for other Linux distributions. Credits for @juanmarcosdev for the helpful Dockerfile: https://github.com/juanmarcosdev/minizinc-or-tools.


## Instructions
Let's install `wget` if we don't already have it.

```bash
apt-get update
apt-get install wget -y
```

Next, let's create `bin/` directory to the home directory.

```bash
mkdir -p $HOME/bin
```

Now, we can use the scripts to install MiniZinc and Google OR-Tools.

The [`install-minizinc`](./install-minizinc.sh) shell script downloads MiniZinc from GitHub releases, extracts the archive to `$HOME/bin` directory, removes the extracted archive and creates the path environment variables.

```bash
./install-minizinc
```

The [`install-or-tools`](./install-or-tools.sh) shell script downloads Google OR-Tools from GitHub releases, extracts the archive to `$HOME/bin` directory, removes the extracted archive and creates a solver configuration file to `$HOME/.minizinc/solvers/or-tools.msc`.

```bash
./install-or-tools
```

## Usage
We can use the solver with the name `or-tools`.

```bash
minizinc --solver or-tools
```
