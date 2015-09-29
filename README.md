# vdsm-host-installer
This is a collection of kickstarts and instructions to create vdsm virtualization node

## Preprequisites
install lorax
install kickstart conigurator
install virt-install

## Step 1
Creating your boot.iso
you can either download your favorite fedora install iso (not livecd install)
Or runthe follwoing line to make it . (Change the version number accordingly)
sudo lorax -p fedora -v 22 -r 1 -s http://mirror.isoc.org.il/pub/fedora/releases/22/Everything/x86_64/os/ base

## Step 2 create the disk using the included kickstart file
 sudo livemedia-creator --make-disk --iso=base/images/boot.iso --ks=ovirt-fc22.ks --vnc vnc

 The --vnc vnc will alow you to minitor the process from the vnc console

 # Centos

 ## Step1
 Download the centos net install disk from  http://isoredirect.centos.org/centos/7/isos/x86_64/

 ## Step 2
 sudo livemedia-creator --make-disk --iso=base/images/boot.iso --ks=ovirt-el7.ks --vnc vnc

