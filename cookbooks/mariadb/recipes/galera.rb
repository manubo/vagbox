include_recipe "mariadb::sources"

package "mariadb-galera-server" do
  action :install
end

package "galera" do
  action :install
end

package "rsync" do
  action :install
end

template "/etc/mysql/conf.d/cluster.cnf" do
  source "cluster.cnf.erb"
  owner "root"
  group "root"
  mode "0644"
end

cookbook_file "debian.cnf" do
  source "debian.cnf"
  path "/etc/mysql/debian.cnf"
  owner "root"
  group "root"
  mode "0600"
end

include_recipe "mariadb::config"
include_recipe "mariadb::service"