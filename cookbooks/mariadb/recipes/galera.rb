include_recipe "mariadb::sources"
include_recipe "mariadb::service"

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

service "mysql" do
  action :restart
end

execute "galera_maintainer" do
  command "mysql -u root -e \"DELETE FROM user WHERE User = 'debian-sys-maint'; FLUSH PRIVILEGES; CREATE USER 'debian-sys-maint'@'localhost' IDENTIFIED BY 'NZrMvGs39kthgsyC'; GRANT ALL PRIVILEGES ON *.* TO 'debian-sys-maint'@'localhost' WITH GRANT OPTION;\" mysql"
  action :run
end

include_recipe "mariadb::config"
