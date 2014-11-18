package "php5-memcached" do
  action :install
  notifies :restart, "service[php5-fpm]", :delayed
end