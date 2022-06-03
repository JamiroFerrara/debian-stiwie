#install nvim
mkdir Downloads
cd /home/$username/Downloads
wget https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.tar.gz
tar xzvf nvim-linux64.tar.gz
mv /home/$username/Downloads/nvim-linux64/bin/nvim /usr/bin

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
