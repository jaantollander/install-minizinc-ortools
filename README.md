# Scripts for Installing MiniZinc and OR-Tools on Linux
These scripts are tested on Ubuntu 20.04. They can be modified for other Linux distributions.

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

```bash
./install-minizinc
```

```bash
./install-or-tools
```
