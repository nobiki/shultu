git clone "https://github.com/riywo/anyenv" ~/.anyenv

echo 'export ANYENV_ROOT=/var/workspace/.anyenv/' >> /tmp/.include_profile
echo 'export ANYENV_DEFINITION_ROOT=/var/workspace/.anyenv/.config/anyenv-install/' >> /tmp/.include_profile

echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> /tmp/.include_profile
echo 'eval "$(anyenv init -)"' >> /tmp/.include_profile

. ./include/goenv.sh
. ./include/phpenv.sh
. ./include/phpcs.sh
. ./include/pyenv.sh
. ./include/rbenv.sh
. ./include/nodenv.sh

