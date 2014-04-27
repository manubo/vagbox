name = "php-mysql"

Vagrant.configure("2") do |config|
  config.vm.box = "wheezy64"

  config.vm.network :private_network, ip: "192.168.77.10"

  config.vm.synced_folder "httpd", "/srv/httpd"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
    vb.customize ["modifyvm", :id, "--name", name]
    vb.customize ["modifyvm", :id, "--cpus", 2]
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
        :version => "v0.11.9"
      },
      :nginx => {
        :mode => 'symfony'
      }
    }

    chef.log_level = :debug

    chef.cookbooks_path = ["cookbooks"]
    chef.roles_path = "roles"
    chef.add_role "php-mysql"
  end
end

