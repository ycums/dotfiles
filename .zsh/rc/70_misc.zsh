WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

HISTFILE=${HOME}/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

if [ "$(uname)" = 'Darwin' ]; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi

# Usage:
# mov2gif hoge.mov #オプション指定なしだと横幅500px・FPS15のGIFを出力
# mov2gif hoge.mov 500 30 #と指定すれば横幅500px・FPS30で出力
function mov2gif() {
	mov=$1;
	if [[ -z $2 ]]; then
		width=500
	else
		width=$2
	fi
	if [[ -z $3 ]]; then
		rate=15
	else
		rate=$3
	fi
	basename=${1##*/}
  	filename=${basename%.*}; 
	gif=${filename}.gif
    echo $gif
	ffmpeg -i $mov -vf scale=$width:-1 -pix_fmt rgb24 -r $rate -f gif - | gifsicle --optimize=3 --delay=3 > $gif
}
