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

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

#Aliases
# Replace `man` with `tldr`
alias man="tldr"

# Replace `cat` with `bat`
alias cat="bat --paging=never"
export BAT_THEME="ansi"

# Replace `ls` with `exa`
alias ls="eza --icons --group-directories-first"


# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

#Starship
eval "$(starship init bash)"
