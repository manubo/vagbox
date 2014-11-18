package "php5-cli" do
  action :install
end

cookbook_file "#{node[:php5][:cli_conf_dir]}/php.ini" do
  mode 00644
  owner "root"
  group "root"
end