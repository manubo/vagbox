execute "elasticsearch" do
  cwd "/tmp"
  command <<-EOF
wget #{node[:elasticsearch][:download]}
dpkg -i #{node[:elasticsearch][:package]}
/usr/share/elasticsearch/bin/plugin -install mobz/elasticsearch-head
rm #{node[:elasticsearch][:package]}
EOF
  creates "/usr/share/elasticsearch/bin/elasticsearch"
end

template "#{node[:nginx][:conf_dir]}/sites-available/elasticsearch.conf" do
  source "elasticsearch.erb"
  owner "root"
  group "root"
  mode "0644"
end

link "#{node[:nginx][:conf_dir]}/sites-enabled/elasticsearch.conf" do
  to "#{node[:nginx][:conf_dir]}/sites-available/elasticsearch.conf"
end

service "elasticsearch" do
  supports :status => true, :restart => true
  action [ :enable, :start ]
end