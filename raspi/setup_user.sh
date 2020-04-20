USER_NAME=ykamikawa
sudo rpi-update
echo "Changing root's password..."
sudo passwd root
echo "Installing git vim zsh tmux..."
sudo apt update
sudo apt upgrade
sudo apt install -y vim zsh tmux
echo "Creating new user: "$USER_NAME
sudo adduser $USER_NAME
echo "Add "$USE_NAME "to user groups"
sudo usermod -G pi,adm,dialout,cdrom,sudo,audio,video,plugdev,games,users,netdev,input,spi,gpio $USER_NAME
groups $USER_NAME
cd
sudo chown -R ykamikawa:ykamikawa dotfiles
sudo cp -r /home/pi/* /home/$USER_NAME
sudo cp  ./lightdm.conf /etc/lightdm/lightdm.conf
sudo cp ./autologin@.service /etc/systemd/system/autologin@.service
su - $USER_NAME

# delete pi user
# change host name
# ssh key
