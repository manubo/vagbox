package "php5-mysql" do
  action :install
  notifies :restart, "service[php5-fpm]"
end