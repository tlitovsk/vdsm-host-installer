# this will be the ovirt host KS file
# it will install a host with all vdsm packages preinstalled
# and repos configured.
#process
install
url --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-22&arch=x86_64

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
repo --name=ovirt --baseurl=http://resources.ovirt.org/pub/ovirt-3.6-snapshot/rpm/fc22/
repo --name=gluster --baseurl=http://download.gluster.org/pub/gluster/glusterfs/3.7/LATEST/Fedora/fedora-22/x86_64/
repo --name=updates --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f22&arch=x86_64

%packages --excludedocs --instLangs=en
@admin-tools
@core
@hardware-support
@standard
-atmel-firmware
-authconfig
-b43-fwcutter
-b43-openfwwf
-dracut-config-rescue
-firewalld
-ipw2100-firmware
-ipw2200-firmware
-iwl100-firmware
-iwl1000-firmware
-iwl105-firmware
-iwl135-firmware
-iwl2000-firmware
-iwl2030-firmware
-iwl3160-firmware
-iwl3945-firmware
-iwl4965-firmware
-iwl5000-firmware
-iwl5150-firmware
-iwl6000-firmware
-iwl6000g2a-firmware
-iwl6000g2b-firmware
-iwl6050-firmware
-iwl7260-firmware
-libertas-usb8388-firmware
-usb_modeswitch
-zd1211-firmware

#live media staff
memtest86+
anaconda

#vdsm staff
vdsm
ovirt-host-deploy-offline
vdsm-cli
ovirt-hosted-engine-setup
glusterfs-server
%end

