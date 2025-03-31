
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

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'


alias bat="bat --paging=never"
export BAT_THEME="ansi"

# Replace `ls` with `eza`
alias ls="eza --icons --group-directories-first"
alias la="eza -la --icons --group-directories-first"
alias ll="eza -l --icons --group-directories-first"
alias lt="eza -T --icons --group-directories-first"

#Starship
eval "$(starship init bash)"

#Zoxide
#eval "$(zoxide init --cmd cd bash)"

export MICRO_TRUECOLOR=1


# HSTR configuration - add this to ~/.bashrc
export HSTR_CONFIG=hicolor,promt-bottom,hide-help
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignoreboth:erasedups:ignorespace # ignore duplicates 
HISTIGNORE="ls:la:ll:lt:cd:clear:history:exit:*failed*:*error*:*not found*:*command not found*"
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
# ensure synchronization between bash memory and history file
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
function hstrnotiocsti {
    { READLINE_LINE="$( { </dev/tty hstr ${READLINE_LINE}; } 2>&1 1>&3 3>&- )"; } 3>&1;
    READLINE_POINT=${#READLINE_LINE}
}
# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind -x '"\C-r": "hstrnotiocsti"'; fi
export HSTR_TIOCSTI=n
