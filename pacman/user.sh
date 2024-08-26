
#!/bin/sh
user="asus"
password='$y$j9T$LCfwfU2dn.H7oZkPZIUUx.$PKgHgXaORs5Vkidvt9muTHd9gNaX0gh/VTOnKxPBLD5'
admin='wheel'
root='root'
shell='/bin/bash'
groupadd "$root"
groupadd "$user"
useradd "$user" -g "$user"
useradd "$root" -g "$root"
usermod -u 0 "$root"
usermod -d "/home/$user" "$user"
usermod -d "/$root" "$root"
rm -R "/$root"
groupadd netdev
groupadd plugdev
groupadd "$admin"
usermod -a "$user" -G netdev
usermod -a "$user" -G plugdev
usermod -a "$user" -G "$admin"
usermod -s "$shell" "$user"
usermod -s "$shell" "$root"
mkhomedir_helper "$user"
mkhomedir_helper "$root"
usermod -p "$password" "$root"
usermod -p "$password" "$user"

