# My .files

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

[Test SSH connection](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/testing-your-ssh-connection)

```sh
ssh -T git@github.com
```

### font

- [`JetBrainsMono`](https://github.com/JetBrains/JetBrainsMono)

- download a patched version of JetBrainsMono from [nerd-fonts](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono/NoLigatures/Regular)

> [!NOTE]
> iTerm2 supports ligatures, but Alacritty does not

