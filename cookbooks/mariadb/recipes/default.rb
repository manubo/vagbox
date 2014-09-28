cookbook_file "/etc/apt/sources.list.d/mariadb.list" do
  source "mariadb.list"
  mode 0644
  owner "root"
  group "root"
  notifies :run, "execute[mariadb_keys]", :immediately
end

execute "mariadb_keys" do
  command "sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db"
  action :nothing
  notifies :run, "execute[apt-update]", :immediately
end

package "mariadb-server" do
  action :install
end