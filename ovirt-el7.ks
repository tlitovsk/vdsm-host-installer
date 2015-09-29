# this will be the ovirt host KS file
# it will install a host with all vdsm packages preinstalled
# and repos configured.
#process
install
url --mirrorlist=http://mirrorlist.centos.org/?release=7&arch=x86_64&repo=os

# setting the instllation disk staff
#autopart --type=lvm --fstype=ext4
zerombr
clearpart --all
bootloader --location=mbr
part swap --size=512
part /  --size=4096

# Networking
network --bootproto=dhcp --device=link --activate --onboot=on

# System authorization information
auth  --useshadow  --passalgo=sha512
rootpw ovirt

#process
shutdown

# System timezone
timezone Africa/Abidjan
# System language
lang en_US
# Keyboard layouts
keyboard 'us'

# SELinux configuration
selinux --enforcing

#repos
repo --name=ovirt --baseurl=http://resources.ovirt.org/pub/ovirt-3.6-snapshot/rpm/el7/
repo --name=gluster --baseurl=http://download.gluster.org/pub/gluster/glusterfs/3.7/LATEST/EPEL.repo/epel-7/x86_64/
repo --name=epel --mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=epel-7&arch=x86_64
repo --name=updates --mirrorlist=http://mirrorlist.centos.org/?release=7&arch=x86_64&repo=updates

%packages --excludedocs --instLangs=en
@ core
@ Server Platform
@ System Management
-atmel-firmware
-authconfig

#live media staff
memtest86+
anaconda
chrony
grub2
vim

#vdsm staff
vdsm
ovirt-host-deploy-offline
vdsm-cli
ovirt-hosted-engine-setup
glusterfs-server
%end

