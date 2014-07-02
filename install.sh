#!/bin/bash

# links in $HOME
if [ -d "${HOME}/dotvim-ng" ]; then
    echo "setting links"
    ln -s "${HOME}/dotvim-ng" "${HOME}/.vim"  > /dev/null 2>&1
    ln -s "${HOME}/dotvim-ng/vimrc" "${HOME}/.vimrc"  > /dev/null 2>&1
else
    echo "${HOME}/dotvim-ng missing"
    exit 1
fi


# if yaourt is available do full install
if [ -x "/usr/bin/yaourt" ]; then
    echo "installing dependencies"
    yaourt -y install ctags clang go mono git  > /dev/null 2>&1

    # install vundle plugins
    echo "installing Vundle"
    git clone 'https://github.com/gmarik/Vundle.vim.git' "${HOME}/.vim/bundle/Vundle.vim"  > /dev/null 2>&1
    # install plugins
    echo "installing Plugins"
    vim  +PluginInstall +qall

    echo "installing completer"
    pushd "${HOME}/.vim/bundle/YouCompleteMe"  > /dev/null 2>&1
    bash "./install.sh" '--clang-completer --omnisharp-completer --system-libclang'  > /dev/null 2>&1
    popd  > /dev/null 2>&1

    echo "installing go packages"
    mkdir -p "${HOME}/gopath/bin"
    mkdir -p "${HOME}/gopath/src"
    go get -u github.com/nsf/gocode
    go get -u github.com/jstemmer/gotags

    echo "building vimproc"
    pushd "${HOME}/.vim/bundle/vimproc.vim" > /dev/null 2>&1
    make > /dev/null 2>&1
    popd > /dev/null 2>&1
else
    echo "TODO: implement full install for more systems"
    echo
    echo "To complete the vim setup install:"
    echo "git   - to fetch Vundle"
    echo "ctags - Tagbar"
    echo "go    - go autocompletion and go tags"
    echo "clang - YouCompleteMe"
    echo "mono  - OnmiSharp"
    exit 0
fi

