# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

zplugin ice wait'!0'; zplugin load zsh-users/zsh-completions
zplugin ice wait'!0'; zplugin load zsh-users/zsh-syntax-highlighting 
zplugin ice wait'!0'; zplugin load zsh-users/zsh-completions 

zplugin ice wait'!0'; zplugin snippet OMZ::plugins/common-aliases/common-aliases.plugin.zsh
zplugin ice wait'!0'; zplugin snippet OMZ::plugins/git/git.plugin.zsh
zplugin ice wait'!0'; zplugin snippet OMZ::plugins/github/github.plugin.zsh
zplugin ice wait'!0'; zplugin snippet OMZ::plugins/ansible/ansible.plugin.zsh
zplugin ice wait'!0'; zplugin snippet OMZ::plugins/docker/_docker
zplugin ice wait'!0'; zplugin snippet OMZ::plugins/cp/cp.plugin.zsh
zplugin ice wait'!0'; zplugin snippet OMZ::plugins/rsync/rsync.plugin.zsh
zplugin ice wait'!0'; zplugin snippet OMZ::plugins/yarn/yarn.plugin.zsh

zplugin load zdharma/history-search-multi-word
zplugin ice compile"*.lzui" from"notabug"
zplugin load zdharma/zui
zplugin ice from"gh-r" as"program"; zplugin load junegunn/fzf-bin
zplugin ice from"gh-r" as"program" mv"docker* -> docker-compose" bpick"*linux*"; zplugin load docker/compose
zplugin ice as"program" atclone"rm -f src/auto/config.cache; ./configure" atpull"%atclone" make pick"src/vim"
zplugin light vim/vim
zplugin ice as"program" pick"$ZPFX/bin/git-*" make"PREFIX=$ZPFX"
zplugin light tj/git-extras
zplugin light zsh-users/zsh-autosuggestions
zplugin light zdharma/fast-syntax-highlighting

zplugin ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zplugin light trapd00r/LS_COLORS

# プロンプト設定（遅延ロード＆ロード後再描画）
zplugin ice depth=1; zplugin light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.zsh/rc/p10k.zsh ]] || source ~/.zsh/rc/p10k.zsh

source "${HOME}/.zsh/rc/30_aliases.zsh"
source "${HOME}/.zsh/rc/50_options.zsh"
source "${HOME}/.zsh/rc/70_misc.zsh"
source "${HOME}/.zsh/rc/80_custom.zsh"
