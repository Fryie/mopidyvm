# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "fedora"
  config.vm.box_url = "https://dl.dropboxusercontent.com/u/1251103/fedora-19-vagrant.box"

  # config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.provision :puppet do |puppet|
    puppet.module_path = 'modules'
  end

end
