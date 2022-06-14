rm -rf "$HOME/.config/nvim"
ln -sf "$PWD/nvim" "$HOME/.config/nvim"

# Install vim plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -sf "$PWD/git/.gitconfig" "$HOME/.gitconfig"
ln -sf "$PWD/git/.gitignore" "$HOME/.gitignore"
ln -sf "$PWD/git/.work-gitconfig" "$HOME/.work/.gitconfig"

git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
ln -sf "$PWD/zsh/.zshrc" "$HOME/.zshrc"

ln -sf "$PWD/tig/.tigrc" "$HOME/.tigrc"

mkdir -p "$HOME/.ssh"
ln -sf "$PWD/ssh/config" "$HOME/.ssh/config"
ln -sf "$PWD/redshift/redshift.conf" "$HOME/.config/redshift/redshift.conf"

sh setup.sh
