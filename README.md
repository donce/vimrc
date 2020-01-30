vimrc
=====

My personal Vim configuration.

Setup
-----

Checkout this repo as ~/.vim:
```bash
git clone git@github.com:donce/vimrc.git ~/.vima
```

Install vim pathogen (https://github.com/tpope/vim-pathogen):
```bash
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```

Fetch submodules:
```bash
git submodule update --init --recursive
```

All done!
