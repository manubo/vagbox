include_recipe "apt"

execute "mariadb-keys" do
  command "apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db"
  notifies :create, "cookbook_file[mariadb.list]", :immediately
end

cookbook_file "mariadb.list" do
  mode 0644
  owner "root"
  group "root"
  path "/etc/apt/sources.list.d/mariadb.list"
  action :nothing
  notifies :run, "execute[apt-update]", :immediately
  notifies :install, "package[mariadb-server]", :immediately
end

package "mariadb-server" do
  action :nothing
end
