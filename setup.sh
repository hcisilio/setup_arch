# Update
sudo pacman -Syu --noconfirm

# Softwares
sudo pacman --noconfirm -S tilix dconf-editor xbindkeys xdotool flameshot git docker docker-compose neovim ripgrep pavucontrol postgresql-libs
sudo pamac install --no-confirm microsoft-edge-stable-bin dropbox hidamari epson-inkjet-printer-escpr

# Usb mount support
sudo pacman --noconfirm -S udisks2 udiskie
# Blacklist ntfs3 to mount ntfs drives
echo 'blacklist ntfs3' | sudo tee /etc/modprobe.d/disable-ntfs3.conf

# docker
sudo usermod -aG docker $USER
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

# code editor
git clone https://github.com/hcisilio/TroxaVim-.git ~/.config/nvim

# Gnome Extensions
#  - Dash to Panel
#  - Vitals
#  - Tilix Quake 
#  - Shortcut on dconf-editor: /org/gnome/shell/extensions/quake-terminal/terminal-shortcut ->  '<Control>Control_R', '<Control>Control_L'
sudo pacman -S --noconfirm gnome-shell-extension-dash-to-panel gnome-shell-extension-vitals

# Customs shortcuts
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-up "['<Super><Shift>Up', '<Shift><Super>j']"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-down "['<Super><Shift>Down', '<Shift><Super>k']"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-left "['<Super><Shift>left', '<Shift><Super>h']"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-right "['<Super><Shift>right', '<Shift><Super>l']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Super>Page_Up', '<Super><Alt>Left', '<Control><Alt>Left', '<Super>ccedilla']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['<Super><Shift>Page_Up', '<Super><Shift>ccedilla']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Super>Page_Down', '<Super><Alt>Right', '<Control><Alt>Right', '<Super>dead_perispomeni']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right "['<Super><Shift>Page_Down', '<Super><Shift>dead_perispomeni']"
gsettings set org.gnome.desktop.wm.keybindings toggle-maximized "['<Super>M']"
gsettings set org.gnome.settings-daemon.plugins.media-keys screensaver "['<Super>Escape']"
gsettings set org.gnome.shell.extensions.quake-terminal terminal-shortcut "['F12', '<Control>Control_R', '<Control>Control_L']"

#xbindkeys config and autostart
echo "
######## OBS: INSTALAR O PACOTE XDOTOOL  #######
#Descer espaço de trabalho
\"xdotool key 'Super_R+Next'\"
  b:9

#Subir espaço de trabalho
\"xdotool key 'Super_R+Prior'\"
  b:8
" > .xbindkeysrc

echo "[Desktop Entry]
Name=XbindKeys
Exec=xbindkeys
Terminal=false
Type=Application
" > ~/.config/autostart/xbindkeys.desktop

# Suyu shortcut
echo "[Desktop Entry]
Name=Suyu
Comment=Nintendo Switch Emulator
Type=Application
Exec=/home/hcisilio/Games/Switch/Suyu-Linux_x86_64.AppImage
Icon=/home/hcisilio/Pictures/suyu.png
Terminal=false" > ~/.local/share/applications/suyu.desktop