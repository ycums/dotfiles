# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#
# Using the zsh shell
# Installation guide https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH#install-and-set-up-zsh-as-default
#
# Using zplugin plugin manager for zsh
# For updating all plugins:
#   >> zplugin update --all
# List all plugins
#   >> zplugin ls
# Delete a plugin, examaple fasd from PZT module
#   >> zplugin delete PZT::modules/fasd
# Status of zplugin and location of plugins and directories
#   >> zplugin zstatus
# https://github.com/zdharma/zplugin/wiki/INSTALLATION
#

source "${HOME}/.zsh/rc/10_exports.zsh"

### Added by Zplugin's installer
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin installer's chunk

zplugin snippet OMZ::plugins/common-aliases/common-aliases.plugin.zsh
zplugin load zsh-users/zsh-completions
zplugin snippet OMZ::lib/git.zsh
zplugin ice wait'!0'; zplugin load zsh-users/zsh-syntax-highlighting 
zplugin ice wait'!0'; zplugin load zsh-users/zsh-completions 

source "${HOME}/.zsh/rc/30_aliases.zsh"
source "${HOME}/.zsh/rc/50_options.zsh"
source "${HOME}/.zsh/rc/70_misc.zsh"
source "${HOME}/.zsh/rc/80_custom.zsh"

zplugin snippet OMZ::plugins/git/git.plugin.zsh
zplugin snippet OMZ::plugins/github/github.plugin.zsh
zplugin snippet OMZ::plugins/gnu-utils/gnu-utils.plugin.zsh
zplugin snippet OMZ::plugins/zsh_reload/zsh_reload.plugin.zsh

# ssh でリモートのシェルに自分の rc ファイルをロードします。
zplugin snippet --command \
    'https://raw.githubusercontent.com/Russell91/sshrc/master/sshrc'


# プロンプト設定（遅延ロード＆ロード後再描画）
zplugin ice depth=1; zplugin light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.zsh/rc/p10k.zsh ]] || source ~/.zsh/rc/p10k.zsh
