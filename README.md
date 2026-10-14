# Dotfiles

Global dotfiles for macOS (shell config shared across machines).

## Install

```bash
cd dotfiles
cp .zshrc ~/.zshrc
cp .p10k.zsh ~/.p10k.zsh
```

Prerequisites (Homebrew):

- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [zsh-completions](https://github.com/zsh-users/zsh-completions)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [fzf](https://github.com/junegunn/fzf) for interactive branch selection

```bash
brew install powerlevel10k zsh-completions zsh-autosuggestions zsh-syntax-highlighting fzf
```

Then reload:

```bash
source ~/.zshrc
```

## Branch selector

In any Zsh terminal, run `branch` inside a Git repository. Search local branches, then press Enter or double-click one to switch. Esc cancels.


## Theme

Dark purple Powerlevel10k prompt, aligned with a Github Purple–style editor theme.

## History

`.zshrc` configures shared history with no duplicates (`HISTSIZE` / `SAVEHIST`, `sharehistory`, `hist_ignore_*`).

## Secrets

Tokens and private env vars stay outside the repo in `~/.zsh_secrets`, loaded only if the file exists:

```bash
[[ -f ~/.zsh_secrets ]] && source ~/.zsh_secrets
```

