packer build -force -only virtualbox base.json &&
packer build -force -only vmware base.json &&
vagrant box add ubuntu1210 base_vmware.box --provider=vmware_desktop -f &&
vagrant box add ubuntu1210 base_virtualbox.box --provider=virtualbox -f
