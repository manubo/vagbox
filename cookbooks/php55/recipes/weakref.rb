execute "pecl_add_channel_weakref" do
  command "pear channel-discover pecl.php.net/weakref-0.2.2"
end

execute "pecl install weakref" do
  creates "#{node[:php55][:extension_dir]}/weakref.so"
  user "root"
  notifies :restart, "service[php5-fpm]"
end