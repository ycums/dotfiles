WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

HISTFILE=${HOME}/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

if [ "$(uname)" = 'Darwin' ]; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi
