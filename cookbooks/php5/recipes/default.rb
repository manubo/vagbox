include_recipe "php5::ppa"

package "php5-fpm" do
  action :install
end

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

service "php5-fpm" do
  supports :restart => true
  action :nothing
end




