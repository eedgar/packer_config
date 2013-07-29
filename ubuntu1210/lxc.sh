#packer build -only=virtualbox lxc.json
rm -rf output*
rm -rf *.box
packer build -force -only=virtualbox lxc.json &&
vagrant box add lxc lxc_virtualbox.box --provider=virtualbox -f &&
vagrant destroy -f
vagrant up

#packer build -force -only=vmware lxc.json &&
#vagrant box add lxc lxc_vmware.box --provider=vmware_desktop -f &&
#vagrant up --provider=vmware_fusion

