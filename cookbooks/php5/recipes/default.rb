package "php5-fpm" do
  action :install
end

files = %w{
  "#{node[:php5][:fpm_conf_dir]}/php.ini"
  "#{node[:php5][:fpm_conf_dir]}/php-fpm.conf"
  "#{node[:php5][:fpm_conf_dir]}/pool.d/www.conf"
}

cookbook_file "#{node[:php5][:fpm_conf_dir]}/php.ini" do
    mode 00644
    owner "root"
    group "root"
end

cookbook_file "#{node[:php5][:fpm_conf_dir]}/php-fpm.conf" do
    mode 00644
    owner "root"
    group "root"
end

cookbook_file "#{node[:php5][:fpm_conf_dir]}/pool.d/www.conf" do
    mode 00644
    owner "root"
    group "root"
end

# files.each do |file|
#   cookbook_file file do
#     mode 00644
#     owner "root"
#     group "root"
#   end
# end

service "php5-fpm" do
  supports :restart => true
  action [ :enable, :start ]
end