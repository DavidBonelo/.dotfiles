# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# añadidas manualmente
export DENO_INSTALL="/home/yeru/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH="/home/yeru/.local/bin:$PATH"
export FLUTTER_INSTALL="/home/yeru/Documents/src/flutter"
export PATH="$FLUTTER_INSTALL/bin:$PATH"
export CHROME_EXECUTABLE="/home/yeru/.local/share/flatpak/exports/bin/org.chromium.Chromium"
export PATH="~/.local/share/flatpak/exports/bin:$PATH"



# Added by Toolbox App
export PATH="$PATH:/home/yeru/.local/share/JetBrains/Toolbox/scripts"

. "$HOME/.cargo/env"
