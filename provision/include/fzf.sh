tee /tmp/.include_profile << 'EOF'
if [ ! -e ~/.fzf ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --key-bindings --completion --update-rc

    echo '[ -f ~/.fzf.bash ] && source ~/.fzf.bash' >> /tmp/.include_profile
fi
EOF

