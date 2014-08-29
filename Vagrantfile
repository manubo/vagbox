name = "node-mongo"

Vagrant.configure("2") do |config|
  config.vm.box = "trusty64"

  config.vm.network :private_network, ip: "192.168.77.33"

  config.vm.synced_folder ".", "/srv/"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
    vb.customize ["modifyvm", :id, "--name", name]
    vb.customize ["modifyvm", :id, "--cpus", 1]
    vb.gui = false
  end

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      :node => {
        :version => "v0.10.30"
      }
    }

    chef.custom_config_path = "Vagrantfile.chef"
    chef.log_level = :debug

    chef.cookbooks_path = ["cookbooks"]
    chef.roles_path = "roles"
    chef.add_role "node-mongo"
  end
end
