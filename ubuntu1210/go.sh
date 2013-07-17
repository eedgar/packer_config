packer build -force -only=vmware template.json &&
vagrant box add ubuntu1210_packer packer_vmware_vmware.box --provider=vmware_desktop -f
