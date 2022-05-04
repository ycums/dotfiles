source "${HOME}/.zsh/rc/10_exports.zsh"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit load zsh-users/zsh-completions
zinit load zsh-users/zsh-syntax-highlighting 
zinit load zsh-users/zsh-completions 

zinit ice from"gh-r" as"program" mv"docker* -> docker-compose"
zinit light docker/compose

zinit snippet OMZ::plugins/common-aliases/common-aliases.plugin.zsh
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet OMZ::plugins/github/github.plugin.zsh
zinit snippet OMZ::plugins/ansible/ansible.plugin.zsh
zinit snippet OMZ::plugins/docker/_docker
zinit snippet OMZ::plugins/cp/cp.plugin.zsh
zinit snippet OMZ::plugins/rsync/rsync.plugin.zsh
zinit snippet OMZ::plugins/yarn/yarn.plugin.zsh
zinit snippet OMZ::plugins/sudo/sudo.plugin.zsh

zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zinit light trapd00r/LS_COLORS

zinit ice depth=1; zinit light romkatv/powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.zsh/rc/p10k.zsh ]] || source ~/.zsh/rc/p10k.zsh

source "${HOME}/.zsh/rc/30_aliases.zsh"
source "${HOME}/.zsh/rc/50_options.zsh"
source "${HOME}/.zsh/rc/70_misc.zsh"
source "${HOME}/.zsh/rc/80_custom.zsh"
