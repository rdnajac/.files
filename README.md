# My dotfiles

My dotfiles repository, managed with [chezmoi](https://chezmoi.io/).

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin" init --apply https://github.com/rdnajac/.files.git
```

## TODO

chezmoi: /Users/rdn/.local/share/chezmoi/.chezmoiexternal.toml.tmpl: template:
/Users/rdn/.local/share/chezmoi/.chezmoiexternal.toml.tmpl:16:9: executing
"/Users/rdn/.local/share/chezmoi/.chezmoiexternal.toml.tmpl" at
<gitHubLatestReleaseAssetURL "junegunn/fzf" (printf "fzf-*-%s_%s.tar.gz"
.chezmoi.os .chezmoi.arch)>: error calling gitHubLatestReleaseAssetURL: Get
"https://api.github.com/repos/junegunn/fzf/releases/latest": dial tcp: lookup
api.github.com: no such host


## Resources:

https://www.chezmoi.io/user-guide/templating/

## License

MIT

