[atlassian guide](https://www.atlassian.com/git/tutorials/dotfiles)
## Basic usage
```sh
gitdot status
gitdot add .bashrc
gitdot commit -m "update bashrc"
gitdot push
```
## Install these dotfiles onto a new system

- Prior to the installation make sure to have committed the alias to the `.bashrc` or `.zsh`:
```sh
alias gitdot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```
- And that the source repository ignores the folder where it'll get cloned, so that it doesn't create weird recursion problems:
```sh
echo ".dotfiles" >> .gitignore
```
- Now clone the dotfiles into a bare repository in a "dotfiles" folder in $HOME:

```sh
git clone --bare <git-repo-url> $HOME/.dotfiles
```
- Define the alias in the current shell scope:

```sh
alias gitdot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

- Checkout the actual content from the bare repository to $HOME:

```sh
gitdot checkout
```

- The step above might fail with a message like:

```
error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting
```

This is because the $HOME folder might already have some stock configuration files which would be overwritten by Git. The solution is simple: a shortcut to move all the offending files automatically to a backup folder:

```sh
mkdir -p .dotfiles-backup && \
gitdot checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .dotfiles-backup/{}
```

- Re-run the check out if there were problems:

```sh
gitdot checkout
```

- Set the flag showUntrackedFiles to no on this specific (local) repository:

```sh
gitdot config --local status.showUntrackedFiles no
```
Done!
