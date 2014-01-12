package "php5-intl" do
  action :install
  notifies :restart, "service[php5-fpm]"
end