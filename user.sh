  if getent passwd vsdg > /dev/null 2>&1; then
    cp ~/user.sh /home/vsdg
else
      read -p "Password: " password
        sudo adduser vsdg
        usermod -aG sudo vsdg
        cp vsdg.sh /home/vsdg/vsdg.sh
fi
  
