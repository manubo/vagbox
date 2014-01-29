execute "elasticsearch" do
  cwd "/tmp"
  command <<-EOF
wget #{node[:elasticsearch][:download]}
dpkg -i #{node[:elasticsearch][:package]}
/usr/share/elasticsearch/bin/plugin -install mobz/elasticsearch-head
EOF
  creates "/usr/share/elasticsearch/bin/elasticsearch"
end

template "elasticsearch" do
  path "#{node[:nginx][:conf_dir]}/sites-available/elasticsearch"
  owner "root"
  group "root"
  mode "0644"
end

link "#{node[:nginx][:conf_dir]}/sites-available/elasticsearch" do
  to "#{node[:nginx][:conf_dir]}/sites-enables/elasticsearch"
end

service "elasticsearch" do
  supports :status => true, :restart => true
  action [ :enable, :start ]
end