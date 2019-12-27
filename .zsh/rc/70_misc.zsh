WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
if [ "$(uname)" = 'Darwin' ]; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
