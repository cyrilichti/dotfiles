# Dotfiles

Global dotfiles for a consistent macOS Zsh experience across machines.

Features:

- Powerlevel10k prompt
- Command completion, suggestions, and syntax highlighting
- Interactive Git branch selector
- Shared command history
- Local secrets kept outside the repository

## Install

These instructions use macOS Zsh with Homebrew at `/opt/homebrew` (the default on Apple Silicon). Both `.zprofile` and the Powerlevel10k theme path in `.zshrc` use that prefix. Other Homebrew locations require adjusting those paths first.

### 1. Install Homebrew and shell dependencies

On a new Mac, install the Command Line Tools and wait for the installation to finish:

```bash
xcode-select --install
```

Install Homebrew using the command from [brew.sh](https://brew.sh/), then initialize it in the current terminal:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
```

See the [Homebrew installation requirements](https://docs.brew.sh/Installation) for supported macOS versions and installer details.

Install the theme, completion and suggestion plugins, and the interactive branch selector:

```bash
brew install powerlevel10k zsh-completions zsh-autosuggestions zsh-syntax-highlighting fzf
```

### 2. Copy the configuration

Clone the repository and enter its directory:

```bash
git clone https://github.com/cyrilichti/dotfiles.git
cd dotfiles
```

The following commands replace existing configuration files. Back up any files you want to keep first. Keep an existing `~/.zsh_secrets` and merge the example manually instead of copying over its values.

```bash
cp .zshrc ~/.zshrc
cp .p10k.zsh ~/.p10k.zsh
cp .zprofile ~/.zprofile
cp -n .zsh_secrets.example ~/.zsh_secrets
chmod 600 ~/.zsh_secrets
```

[Zsh reads `.zprofile` for login shells before `.zshrc`](https://zsh.sourceforge.io/Doc/Release/Files.html#Startup_002fShutdown-Files). This profile runs Homebrew's `shellenv` to make its commands available. Interactive shells then load `.zshrc` for the prompt, history, completion, plugins, and local secrets. These instructions use Zsh's default configuration directory, your home directory (`ZDOTDIR` unset).

### 3. Configure local secrets

Edit `~/.zsh_secrets` locally. Replace the example placeholders with your own environment variable names and values, and uncomment only the exports you need. You can leave the file unchanged if you do not need secrets.

`.zshrc` sources this file when it exists. Keep populated values in your home directory; the repository's `.zsh_secrets.example` contains commented placeholders only. `.gitignore` also excludes `.zsh_secrets` from accidental staging within the repository.

### 4. Verify shell startup

Check syntax, then start a new interactive login shell so both `.zprofile` and `.zshrc` load:

```bash
zsh -n ~/.zprofile
zsh -n ~/.zshrc
zsh -n ~/.p10k.zsh
zsh -n ~/.zsh_secrets
exec zsh -l
```

The prompt should appear without missing-file or command-not-found errors. In the new shell, run:

```zsh
brew --prefix
whence -w p10k branch
```

Expect `/opt/homebrew`, `p10k: function`, and `branch: function`. Do not print secret values to verify loading. If the prompt's icons look wrong, install and select the [font recommended by Powerlevel10k](https://github.com/romkatv/powerlevel10k#fonts) in your terminal settings.

## Features

### Prompt

Powerlevel10k shows the current directory and Git status at a glance, so you can see where you are before running a command. The dark purple theme matches a GitHub Purple–style editor theme. Run `p10k configure` to customize it.

### Command assistance

Completion helps finish commands and paths, suggestions bring back commands from your history, and syntax highlighting makes typing mistakes easier to notice before you run them.

### Branch selector

Run `branch` inside a Git repository to search local branches and switch without typing the full name. Press Enter or double-click to select one; Esc cancels. After switching, it runs `git pull --ff-only` to update the selected branch. If the branch has no tracked remote or cannot be fast-forwarded, Git reports the issue without creating a merge commit.

### History

Command history is shared across Zsh terminals, so a command used in one session is available in another. Duplicate entries are filtered out to make past commands easier to find.

### Local secrets

Store tokens and machine-specific environment variables in `~/.zsh_secrets`. They load with your shell while staying out of the shared repository, so the same configuration can be used on another Mac without copying private values.
