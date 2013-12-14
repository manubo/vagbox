name = "webrtc"

Vagrant.configure("2") do |config|
  config.vm.box = "wheezy64"

  config.vm.network :public_network, :bridge => 'en1: WLAN (AirPort)', ip: "192.168.0.109"

  config.vm.synced_folder "shared", "/srv/www"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
    vb.customize ["modifyvm", :id, "--name", name]
    vb.gui = false
  end

  config.vm.provision :chef_solo do |chef|
    chef.json = {
        :sys => {
            :name => name
        },
        :php55 => {
            :libversion => "20121212"
        }
    }

    chef.log_level = :debug

    chef.cookbooks_path = ["cookbooks"]
    chef.roles_path = "roles"
    chef.add_role "node-mongo"
  end
end

