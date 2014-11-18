NAME = "php56"

Vagrant.configure("2") do |config|
  config.vm.box = "wheezy64"

  config.vm.network :private_network, ip: "192.168.77.12"

  config.vm.synced_folder ".", "/srv/httpd"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
    vb.customize ["modifyvm", :id, "--name", NAME]
    vb.customize ["modifyvm", :id, "--cpus", 1]
    vb.gui = false
  end

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      :project => {
        :name => NAME
      },
      :php5 => {
        :libversion => "20121212"
      },
      :node => {
        :version => "v0.10.33"
      },
      :nginx => {
        :mode => 'symfony'
      },
      :mongodb => {
        :version => '2.6.0'
      }
    }

    chef.log_level = :debug

    chef.cookbooks_path = [".chef/cookbooks"]
    chef.roles_path = ".chef/roles"
    chef.add_role "php-mysql"
  end
end

