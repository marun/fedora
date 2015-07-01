#!/bin/bash -eux

echo 'deltarpm=0' >> /etc/dnf/dnf.conf
sed -i -e 's+#baseurl=+baseurl=+' /etc/yum.repos.d/*.repo
sed -i -e 's+metalink=+#metalink=+' /etc/yum.repos.d/*.repo
sed -i -e 's+download.fedoraproject.org/pub+mirror.hmc.edu+' /etc/yum.repos.d/*.repo

if [[ $UPDATE  =~ true || $UPDATE =~ 1 || $UPDATE =~ yes ]]; then
    echo "==> Applying updates"
    yum -y update

    # reboot
    echo "Rebooting the machine..."
    reboot
    sleep 60
fi
