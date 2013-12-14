include_recipe "apt-update"

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
  notifies :run, "execute[apt-get-update]", :immediately
end

package "mongodb-10gen" do
  version "2.4.8"
end

service "mongodb" do
  supports :status => true, :restart => true
  action [:enable, :start]
end