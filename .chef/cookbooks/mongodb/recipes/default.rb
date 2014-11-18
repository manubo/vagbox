include_recipe "apt"

cookbook_file "/etc/apt/sources.list.d/mongodb.list" do
  source "mongodb.list"
  mode 0644
  owner "root"
  group "root"
  notifies :run, "execute[mongodb_keys]", :immediately
end

execute "mongodb_keys" do
  command "sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10"
  action :nothing
  notifies :run, "execute[apt-update]", :immediately
end

package "mongodb-org" do
  action :install
end

service "mongod" do
  supports :status => true, :restart => true
  action [:enable, :start]
end