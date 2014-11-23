# directories.each do |dir|
#   directory dir do
#     owner "root"
#     group "root"
#     mode 0777
#     action :create
#   end
# end

package "nginx-full" do
  action :install
end

cookbook_file "nginx.conf" do
  source "nginx.conf"
  path "#{node[:nginx][:conf_dir]}/nginx.conf"
  owner "root"
  group "root"
  mode "0644"
end

cookbook_file "key.pem" do
  source "key.pem"
  path "#{node[:nginx][:ssl_key_dir]}/key.pem"
  owner "root"
  group "root"
  mode "0600"
end

cookbook_file "cert.pem" do
  source "cert.pem"
  path "#{node[:nginx][:ssl_cert_dir]}/cert.pem"
  owner "root"
  group "root"
  mode "0600"
end

template "#{node[:nginx][:conf_dir]}/sites-available/default.conf" do
  source "default-#{node[:nginx][:mode]}.erb"
  owner "root"
  group "root"
  mode "0644"
end

link "#{node[:nginx][:conf_dir]}/sites-enabled/default.conf" do
  to "#{node[:nginx][:conf_dir]}/sites-available/default.conf"
end

service "nginx" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end