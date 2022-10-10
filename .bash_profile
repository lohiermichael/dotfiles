# .bash_profile is used for login shells.
# .bashrc is used for non-login shells.
# We want to import all configurations from .bashrc
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi