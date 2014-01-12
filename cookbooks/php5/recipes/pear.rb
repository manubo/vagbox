package "php-pear" do
  action :install
  notifies :restart, "service[php5-fpm]"
end