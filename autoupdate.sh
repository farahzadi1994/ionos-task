#! /bin/bash

#First We Fix Mirror centos8
sed -i s/mirror.centos.org/vault.centos.org/g /etc/yum.repos.d/*.repo
sed -i s/^#.*baseurl=http/baseurl=http/g /etc/yum.repos.d/*.repo
sed -i s/^mirrorlist=http/#mirrorlist=http/g /etc/yum.repos.d/*.repo
#We have Error with DNF Module so I Upgrade it with libmodulemd (Module yaml error: Unexpected key in data: static_context [line 9 col 3])
dnf update libmodulemd -y
#Then We Upgrade python3-dimclient-1.0.1-2.21.noarch.rpm 
dnf install https://download.opensuse.org/repositories/home:/zeromind:/dim/RockyLinux_8/noarch/python3-dimclient-1.0.1-2.21.noarch.rpm -y

#At The Next we Upgrade ndcli and will be replace it with  python3-ndcli.x86_64 4.0.0-1.el8
dnf install -y https://download.opensuse.org/repositories/home:/zeromind:/dim/RockyLinux_8/noarch/ndcli-5.0.2-2.18.noarch.rpm

# After All We can Upgrade Dim to 5.0.2
dnf upgrade -y https://github.com/ionos-cloud/dim/releases/download/dim-5.0.2/dim-5.0.2-1.el8.x86_64.rpm
