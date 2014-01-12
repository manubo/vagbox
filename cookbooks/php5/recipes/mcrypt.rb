package "php5-mcrypt" do
  action :install
  notifies :restart, "service[php5-fpm]"
end