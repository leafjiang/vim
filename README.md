# Leaf's vim configuration

## Ubuntu 18.04 pre-installation instructions
```
sudo apt install vim-gtk3
sudo apt install ctags
```

## Installation instructions
```bash
cd ~
git clone https://github.com/leafjiang/vim.git
cp ~/vim/.vimrc .
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mvim or vim
:BundleInstall
```
To update .vimrc on github, you need to change the .vimrc in ~/vim

