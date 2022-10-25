# Change the default shell to be zsh
chsh -s /bin/zsh

# Remove existing Oh my zsh configuration if existing
ZSH_CONFIG_FOLDER="/Users/$USER/.oh-my-zsh"
if [ -d  $ZSH_CONFIG_FOLDER ];
    then
        echo "Remove old Oh my zsh configuration..."
        rm -rf $ZSH_CONFIG_FOLDER
        echo "Done!"
fi

# Install Oh my zsh!
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install power10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
