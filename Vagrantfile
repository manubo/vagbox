name = "node-mongo"

Vagrant.configure("2") do |config|
  config.vm.box = "wheezy64"

  config.vm.network :private_network, ip: "192.168.77.12"

  config.vm.synced_folder "www", "/srv/www"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
    vb.customize ["modifyvm", :id, "--name", name]
    vb.customize ["modifyvm", :id, "--cpus", 1]
    vb.gui = false
  end

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      "sys" => {
        :name => name
      },
      :php5 => {
        :libversion => "20121212"
      },
      :node => {
        :version => "v0.10.30"
      },
      :nginx => {
        :mode => 'node'
      },
      :mongodb => {
        :version => '2.6.0'
      }
    }

    chef.log_level = :debug

    chef.cookbooks_path = [".chef/cookbooks"]
    chef.roles_path = ".chef/roles"
    chef.add_role "node-mongo"
  end
end

