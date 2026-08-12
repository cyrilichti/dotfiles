# Powerlevel10k theme (Homebrew)
# Instant prompt — show the prompt before .zshrc finishes loading
# https://github.com/romkatv/powerlevel10k
# https://github.com/romkatv/powerlevel10k#instant-prompt
# https://github.com/romkatv/powerlevel10k#configuration-wizard
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# History
# https://zsh.sourceforge.io/Doc/Release/Options.html#History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Plugins
# https://zsh.sourceforge.io/Doc/Release/Completion-System.html
# https://github.com/zsh-users/zsh-completions
# https://github.com/zsh-users/zsh-autosuggestions
# https://github.com/zsh-users/zsh-syntax-highlighting
FPATH="$(brew --prefix)/share/zsh-completions:${FPATH}"

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
setopt auto_menu complete_in_word

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Local secrets
[[ -f ~/.zsh_secrets ]] && source ~/.zsh_secrets
