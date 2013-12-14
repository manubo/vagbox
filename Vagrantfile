name = "precise"

Vagrant.configure("2") do |config|
  config.vm.box = "precise64"

  config.vm.network :private_network, ip: "192.168.77.64"

  config.vm.synced_folder "shared", "/srv/www"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
    vb.customize ["modifyvm", :id, "--name", name]
  end

  config.vm.provision :chef_solo do |chef|
    chef.json = {
        :sys => {
            :name => name
        }
    }

    chef.log_level = :debug

    chef.cookbooks_path = ["cookbooks"]
    chef.add_recipe "apt-update"
    chef.add_recipe "dev"
    chef.add_recipe "tools"
    chef.add_recipe "git"
    chef.add_recipe "python"
    chef.add_recipe "node"
    chef.add_recipe "node::grunt-cli"
    chef.add_recipe "node::bower"
    chef.add_recipe "mongodb"
    chef.add_recipe "redis"
  end
end

