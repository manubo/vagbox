include_recipe "php55::sources"

package "php5-fpm" do
  action :install
end

files = %w{
  #{node[:php55][:fpm_conf_dir]}/php.ini
  #{node[:php55][:fpm_conf_dir]}/php-fpm.conf 
  #{node[:php55][:fpm_conf_dir]}/pool.d/www.conf
}

files.each do |file|
  cookbook_file file do
    mode 00644
    owner "root"
    group "root"
  end  
end

service "php5-fpm" do
  supports :restart => true
  action [ :enable, :start ]
end