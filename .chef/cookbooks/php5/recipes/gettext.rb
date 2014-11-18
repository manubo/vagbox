package "php-gettext" do
  action :install
  notifies :restart, "service[php5-fpm]", :delayed
end