#/bin/bash

set -e
set -x

sudo tar zxvf pycharm*tar.gz -C /usr/local/
sudo touch /usr/share/applications/Pycharm.desktop
sudo tee -a /usr/share/applications/Pycharm.desktop << 'EOF'
[Desktop Entry]
Type = Application
Name = Pycharm
GenericName = Pycharm5
Comment = Pycharm5:The Python IDE
Exec = "/usr/local/pycharm-community-5.0.4/bin/pycharm.sh" %f
Icon = /usr/local/pycharm-community-5.0.4/bin/pycharm.png
Terminal = pycharm
Categories = Pycharm;
EOF
