#!/bin/bash

# Find all dot files then if the original file exists, create a backup
# Once backed up to {file}.dtbak symlink the new dotfile in place
for file in $(find . -maxdepth 1 -name ".*" -type f  -printf "%f\n" ); do
    if [ -e ~/$file ]; then
        mv -f ~/$file{,.dtbak}
    fi
    ln -s $PWD/$file ~/$file
done

# Check if vim-addon installed, if not, install it automatically
if hash vim-addon  2>/dev/null; then
    echo "vim-addon (vim-scripts)  installed"
else
    echo "vim-addon (vim-scripts) not installed, installing"
    apt update && apt -y install vim-scripts
fi

##disable IPV6
#if ! /etc/sysctl.d/90-disable-ipv6.conf, then
#    echo "disabling IPV6"
#    echo 'net.ipv6.conf.all.disable_ipv6 = 1' > /etc/sysctl.d/90-disable-ipv6.conf
#    sysctl -p -f /etc/sysctl.d/90-disable-ipv6.conf
#fi

echo "Installed"
