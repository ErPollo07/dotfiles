# Dotfies

In this repository, you will find my personal collection of dotfiles used to configure my development environment. These files help streamline my workflow and ensure consistency across different machines.

## How it works

## How to use it

Go to this folder and run this command:
```bash
stow \<any folder you like\>
```

With this command you create a symlink.

To verify if the symlink is created go to the first folder in your path and run:
```bash
ls -latr
```

If you see somethings like this:
```txt
somethigs else
...
lrwxrwxrwx 1 erpollo erpollo  39 Dec 18 14:52 alacritty -> ../dotfiles/alacritty/.config/alacritty
lrwxrwxrwx 1 erpollo erpollo  25 Dec 18 14:59 i3 -> ../dotfiles/i3/.config/i3
lrwxrwxrwx 1 erpollo erpollo  31 Dec 18 15:03 picom -> ../dotfiles/picom/.config/picom
...
somthigs else
```

This are symlink.
