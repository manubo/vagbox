package "php5-curl" do
  action :install
  notifies :restart, "service[php5-fpm]", :delayed
end