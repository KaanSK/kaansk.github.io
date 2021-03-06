#! /bin/bash

sudo apt install -y wget gnupg2 gnupg-agent scdaemon pcscd git 
mkdir -p ~/.gnupg
wget https://raw.githubusercontent.com/KaanSK/kaansk.github.io/master/docs/key/gpg-agent.conf -P ~/.gnupg
echo "export GPG_TTY=\"\$(tty)\"" >> ~/.zshrc
echo "export SSH_AUTH_SOCK=\"/run/user/$UID/gnupg/S.gpg-agent.ssh\"" >> ~/.zshrc
echo "gpg-connect-agent updatestartuptty /bye > /dev/null" >> ~/.zshrc
git config --global user.email "kaansk@gmail.com"
git config --global user.name "KaanSK"
gpg --keyserver http://pgp.circl.lu --recv-keys 0xC87A8F9F5B2F03CB
ssh-add
git config --global user.signingkey 0xC87A8F9F5B2F03CB
gpg --card-status
