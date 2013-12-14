package "php5-apcu" do
  action :install
  notifies :restart, "service[php5-fpm]"
end