cat << 'EOS' >> /tmp/.include_profile
if [ ! -e ~/.anyenv ]; then
    git clone "https://github.com/riywo/anyenv" ~/.anyenv
fi
EOS

# echo 'export ANYENV_ROOT=~/.anyenv/' >> /tmp/.include_profile
# echo 'export ANYENV_DEFINITION_ROOT=~/.anyenv/.config/anyenv-install/' >> /tmp/.include_profile

echo 'export PATH="~/.anyenv/bin:$PATH"' >> /tmp/.include_profile
echo 'eval "$(anyenv init -)"' >> /tmp/.include_profile

. ./include/goenv.sh
. ./include/phpenv.sh
. ./include/phpcs.sh
. ./include/pyenv.sh
. ./include/rbenv.sh
. ./include/nodenv.sh

