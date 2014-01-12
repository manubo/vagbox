cookbook_file "/etc/php5/mods-available/phalcon.ini" do
  source "phalcon.ini"
  mode 00644
  owner "root"
  group "root"
end

link "/etc/php5/fpm/conf.d/20-phalcon.ini" do
  to "/etc/php5/mods-available/phalcon.ini"
  owner "root"
  group "root"
end

bash "php5-phalcon" do
    cwd "/tmp"
    code <<-EOH
        git clone git://github.com/phalcon/cphalcon.git
        cd cphalcon/build
        ./install
        cd ../..
        rm -rf cphalcon
    EOH
    creates "#{node[:php55][:exension_dir]}/phalcon.so"
    notifies :restart, "service[php5-fpm]"
end