# My .files

Download a patched version of [`JetBrainsMono`](https://github.com/JetBrains/JetBrainsMono)
from [nerd-fonts](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono/NoLigatures/Regular)
with all the glyphs we need for neovim.

## Config

- [Alacritty](https://alacritty.org/config-alacritty.html)

## GitHub

How to connect to GitHub with SSH:

[Generate new SSH key](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

```sh
ssh-keygen -t ed25519 -C "ryan.najac@columbia.edu"
```

[Add SSH key to GitHub](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

```sh
pbcopy < ~/.ssh/id_ed25519.pub
```

> [!NOTE]
> This command works on macOS. For Linux, use `xclip` instead of `pbcopy`.

[Test SSH connection](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/testing-your-ssh-connection)

```sh
ssh -T git@github.com
```

