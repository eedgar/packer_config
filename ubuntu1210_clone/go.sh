packer build -force template.json &&
vagrant box add ubuntu1210_packer packer_vmware_vmware.box --provider=vmware_desktop -f &&
vagrant box add ubuntu1210_packer packer_virtualbox_virtualbox.box --provider=virtualbox -f
