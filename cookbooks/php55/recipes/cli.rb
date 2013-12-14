package "php5-cli" do
  action :install
end

template "#{node[:php55][:cli_conf_dir]}/php.ini" do
  source "php.ini.erb"
  mode 00644
  owner "root"
  group "root"
end