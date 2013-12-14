package "php5-dev" do
  action :install
  notifies :restart, "service[php5-fpm]"
end