cat << 'EOS' >> /tmp/.include_profile
if [ ! -e ~/.fzf ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --key-bindings --completion --update-rc

fi
EOS
echo '[ -f ~/.fzf.bash ] && source ~/.fzf.bash' >> /tmp/.include_profile
