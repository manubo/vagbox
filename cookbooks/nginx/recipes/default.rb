include_recipe "apt::dotdeb"

directories = %w{/var/cache/nginx /var/tmp}

directories.each do |dir|
  directory dir do
    owner "root"
    group "root"
    mode 0777
    action :create
  end
end

package "nginx-full" do
  action :install
end

file "nginx.conf" do
  path "#{node[:nginx][:conf_dir]}/nginx.conf"
  owner "root"
  group "root"
  mode "0644"
end

cookbook_file "key.pem" do
  source "key.pem"
  path "#{node[:nginx][:ssl_key_dir]}/#{node[:sys][:name]}_key.pem"
  owner "root"
  group "root"
  mode "0600"
end

cookbook_file "cert.pem" do
  source "cert.pem"
  path "#{node[:nginx][:ssl_cert_dir]}/#{node[:sys][:name]}_cert.pem"
  owner "root"
  group "root"
  mode "0600"
end

template "default-#{node[:nginx][:mode]}" do
  path "#{node[:nginx][:conf_dir]}/sites-available/default"
  owner "root"
  group "root"
  mode "0644"
end

service "nginx" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :reload ]
end