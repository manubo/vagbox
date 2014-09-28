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