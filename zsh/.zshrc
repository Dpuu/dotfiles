# ------------------------------------------------------------
#  Editor & Core Shell Behavior
# ------------------------------------------------------------
set -o vi
export STARSHIP_CONFIG="$HOME/dotfiles/starship/starship.toml"

# ------------------------------------------------------------
#  Zsh History — Unique, Keep Only Most Recent Occurrence
# ------------------------------------------------------------
# --- Zsh history: unique, keep only most recent occurrence ---

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=50000
export SAVEHIST=50000

# Write commands immediately with timestamps
setopt inc_append_history_time
setopt hist_reduce_blanks

# Dedupe history: keep only the most recent occurrence
hist_dedup_last() {
    fc -W  # flush in-memory history to disk

    local tmp="${HISTFILE}.dedup.$$"

    awk -F ';' '
        { cmd=$2; line[cmd]=$0; order[NR]=cmd }
        END {
            for (i=1; i<=NR; i++) {
                cmd = order[i]
                if (cmd in line) {
                    print line[cmd]
                    delete line[cmd]
                }
            }
        }
    ' "$HISTFILE" > "$tmp"

    mv "$tmp" "$HISTFILE"
    fc -R
}

# ------------------------------------------------------------
#  Oh My Zsh & Plugins
# ------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh


# ------------------------------------------------------------
#  Completion System
# ------------------------------------------------------------
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'


# ------------------------------------------------------------
#  Tools & Integrations
# ------------------------------------------------------------
eval "$(zoxide init zsh)"
source <(fzf --zsh)

export GPG_TTY=$(tty)
export TELEVISION_EDIT_KEY='e'


# ------------------------------------------------------------
#  Aliases
# ------------------------------------------------------------
alias downloads="cd ~/Downloads/"
alias la="ls -la"
alias pip="python -m pip"
alias goma="~/Google\ Drive/God\ man/"
alias zconf="nvim ~/.zshrc"
alias ae="aerospace"
alias docs="cd ~/Documents/"
alias mto="cd ~/Documents/scripts/Graphsters_Thesis/output/"
alias mtoo="open ~/Documents/scripts/Graphsters_Thesis/output/"
alias as="aerospace"
alias c="clear"
alias pwo='open -a "Brave Browser" https://app.trainingpeaks.com/ https://www.strava.com/dashboard https://veloviewer.com/athlete/31913437/summary https://www.fkstudenterna.se/aktuella-traningsskisser/'
alias less='less -N'
# alias ls='nnn -e'
# alias nnn='nnn -e'


# ------------------------------------------------------------
#  Functions
# ------------------------------------------------------------

# Move file and create symlink
move_and_symlink() {
  mv "$1" "$2"
  ln -s "${2%/}/$1" .
}

# Launch Brave as a standalone app window
brapp() {
  /Applications/Brave\ Browser.app/Contents/MacOS/Brave\ Browser --app="$1"
}

# Pipe last command output to less
pipe_last_to_less() {
  eval "${history[$((HISTCMD - 1))]} | less -R"
}
zle -N pipe_last_to_less
bindkey "^_" pipe_last_to_less

# Fully detach GUI program
launch() {
  if [[ -z "$DISPLAY" && "$OSTYPE" == linux* ]]; then
    export DISPLAY=:0
  fi
  nohup "$@" >/dev/null 2>&1 </dev/null &
  disown
}

eval "$(starship init zsh)"
n () {
    [ "${NNNLVL:-0}" -eq 0 ] || {
        echo "nnn is already running"
        return
    }

    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    command nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
        . "$NNN_TMPFILE" & printf '\n'
        > "$NNN_TMPFILE"   # truncate instead of deleting
    fi
}
