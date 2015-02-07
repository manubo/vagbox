package "postfix" do
  action :install
end

cookbook_file "/etc/postfix/main.cf" do
  source "main.cf"
  mode 0644
  owner "root"
  group "root"
end

template "/etc/postfix/sasl/sasl_passwd" do
  source "sasl_passwd.erb"
  mode 0600
  owner "root"
  group "root"
  variables username: "#{node[:postfix][:smtp_username]}", password: "#{node[:postfix][:smtp_password]}"
end

execute "create_hash_db" do
  command "/usr/sbin/postmap /etc/postfix/sasl/sasl_passwd"
  creates "/etc/postfix/sasl/sasl_passwd.db"
  notifies :restart, "service[postfix]", :immediately
end

service "postfix" do
  supports :status => true, :restart => true, :reload => true
  action :nothing
end 
