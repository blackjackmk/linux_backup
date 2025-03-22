# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

export HISTCONTROL=ignoreboth   # Ignore duplicates and commands starting with spaces
export HISTIGNORE="ls:cd:clear:history:exit"  # Ignore common commands

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

export FZF_DEFAULT_OPTS="--height 40% --layout reverse"

# Preview file content using bat
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers --line-range=:500 {}' --preview-window '~3'"
export FZF_ALT_C_OPTS="--walker-skip .git,venv,target --preview 'eza --color=always --tree --icons --group-directories-first {}'"

alias gl="git log --oneline | fzf --preview 'git show --color=always {1}'"

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

# Replace `man` with `tldr`
alias man="tldr"

# Replace `cat` with `bat`
alias cat="bat --paging=never"
export BAT_THEME="ansi"

# Replace `ls` with `eza`
alias ls="eza --icons --group-directories-first"

#Starship
eval "$(starship init bash)"
