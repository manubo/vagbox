execute "pecl install mongo" do
  user "root"
  creates "#{node[:php5][:extension_dir]}/mongo.so"
  notifies :restart, "service[php5-fpm]"
end

cookbook_file "/etc/php5/mods-available/mongo.ini" do
  source "mongo.ini"
  mode 00644
  owner "root"
  group "root"
end

link "/etc/php5/fpm/conf.d/20-mongo.ini" do
  to "/etc/php5/mods-available/mongo.ini"
  owner "root"
  group "root"
end