sudo git clone "https://github.com/b4b4r07/enhancd.git" /usr/local/lib/enhancd
sudo chmod +x /usr/local/lib/enhancd/init.sh
sudo chown -R 1000:1000 /usr/local/lib/enhancd
echo 'source /usr/local/lib/enhancd/init.sh' >> /tmp/.include_profile
