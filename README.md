# Dotfiles

A macOS Zsh setup that brings the same shell experience to each machine.

## What you get

- **A prompt that is easy to read:** Powerlevel10k shows your current directory and Git status, so you can see where you are at a glance. The dark purple theme can be adjusted with `p10k configure`.
- **Faster command entry:** completions help you finish commands, autosuggestions offer commands from your history, and syntax highlighting makes mistakes easier to spot before you run them.
- **A branch picker:** run `branch` in a Git repository to search local branches and switch without typing the full name. Press Esc to cancel.
- **History across terminals:** commands remain available in new Zsh sessions, while duplicate entries are filtered out.
- **Private, machine-specific values:** keep tokens and other local environment variables in `~/.zsh_secrets`, outside the shared configuration. The repository includes an example with placeholders.

## Set up a new Mac

This setup expects macOS with Zsh and Homebrew installed at `/opt/homebrew` (the default on Apple Silicon). Install the Command Line Tools with `xcode-select --install`, then install Homebrew using the instructions at [brew.sh](https://brew.sh/).

Install the prompt and shell tools:

```bash
eval "$(/opt/homebrew/bin/brew shellenv)"
brew install powerlevel10k zsh-completions zsh-autosuggestions zsh-syntax-highlighting fzf
```

Clone the repository and copy the configuration. The `cp` commands replace existing files, so save any configuration you want to keep first.

```bash
git clone https://github.com/cyrilichti/dotfiles.git
cd dotfiles
cp .zprofile ~/.zprofile
cp .zshrc ~/.zshrc
cp .p10k.zsh ~/.p10k.zsh
cp -n .zsh_secrets.example ~/.zsh_secrets
chmod 600 ~/.zsh_secrets
exec zsh -l
```

The profile makes Homebrew available when Zsh starts. If you need local tokens or environment variables, edit `~/.zsh_secrets` and uncomment only the examples you use. Keep any existing secrets file and merge the example by hand if needed.

Your new shell should open without errors. Run `branch` inside a Git repository to try the branch picker. If prompt icons look wrong, select a [Powerlevel10k font](https://github.com/romkatv/powerlevel10k#fonts) in your terminal.
