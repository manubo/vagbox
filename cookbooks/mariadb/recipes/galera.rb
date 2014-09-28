include_recipe "mariadb::sources"
include_recipe "mariadb::config"

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

package "mariadb-galera-server" do
  action :install
end

package "galera" do
	action :install
end

package "rsync" do
	action :install
end

if (node[:mariadb][:is_first])

  service "mysql" do
    supports :status => true, :restart => true, "force-reload" => true
    start_command "/etc/init.d/mysql start --wsrep-new-cluster"
    action [:enable, :start]
  end

else

  service "mysql" do
    supports :status => true, :restart => true, "force-reload" => true
    action [:enable, :start]
  end

end