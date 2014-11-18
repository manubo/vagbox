package "php5-gd" do
  action :install
  notifies :restart, "service[php5-fpm]", :delayed
end
