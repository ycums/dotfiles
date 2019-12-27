#!/bin/bash

DOTPATH="$HOME/.dotfiles"
GITHUB_URL="https://github.com/ycums/dotfiles"
TAR_BALL_URL="$GITHUB_URL/archive/master.tar.gz"

function has() {
    type -a $1 >/dev/null 2>&1
}

function die() {
    echo $@ >&2
    exit 1
}

# git が使えるなら git
if has "git"; then
    git clone --recursive "$GITHUB_URL" "$DOTPATH"

# 使えない場合は curl か wget を使用する
elif has "curl" || has "wget"; then
    # どっちかでダウンロードして，tar に流す
    if has "curl"; then
        curl -L "$TAR_BALL_URL"

    elif has "wget"; then
        wget -O - "$TAR_BALL_URL"

    fi | tar zxv

    # 解凍したら，DOTPATH に置く
    mv -f dotfiles-master "$DOTPATH"

else
    die "curl or wget required"
fi

cd $DOTPATH
if [ $? -ne 0 ]; then
    die "not found: $DOTPATH"
fi

# 移動できたらリンクを実行する
for f in .??*; do
    [ "$f" = ".git" ] && continue

    ln -snfv "$DOTPATH/$f" "$HOME/$f"
done
