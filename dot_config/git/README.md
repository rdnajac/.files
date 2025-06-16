# Connect to GitHub with SSH

[Generate new SSH key](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

```sh
ssh-keygen -t ed25519 -C "ryan.najac@columbia.edu"
```

[Add SSH key to GitHub](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

```sh
# On macOS:
pbcopy < ~/.ssh/id_ed25519.pub

# On Linux:
xclip -selection clipboard < ~/.ssh/id_ed25519.pub
```

> [!IMPORTANT]
> Add the new key [here](https://github.com/settings/keys)

[Test SSH connection](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/testing-your-ssh-connection)

```sh
ssh -T git@github.com
```

