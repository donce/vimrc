# Install vim pathogen (https://github.com/tpope/vim-pathogen):
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Fetch submodules:
cd ~/.vim
git submodule update --init --recursive
