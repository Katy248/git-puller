# Git puller

Shell script for pulling multiple repositories on your PC

## Install

**Requirements:**

- git
- make

```
git clone https://github.com/Katy248/git-puller
cd git-puller
sudo make install
```

## Configuration

Write path to local repositories to `~/.config/git-puller/dir.list` and run `git-puller`

Exaxmple `~/.config/git-puller/dir.list`:

```list
~/.config/vim/
~/.config/gtk-4.0
```
