package "php5-xdebug" do
  action :install
  notifies :restart, "service[php5-fpm]", :delayed
end

cookbook_file "/etc/php5/mods-available/xdebug.ini" do
  source "xdebug.ini"
  mode 00644
  owner "root"
  group "root"
end

link "/etc/php5/fpm/conf.d/20-xdebug.ini" do
  to "/etc/php5/mods-available/xdebug.ini"
  owner "root"
  group "root"
end