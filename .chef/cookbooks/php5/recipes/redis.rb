package "php5-redis" do
  action :install
  notifies :restart, "service[php5-fpm]", :delayed
end