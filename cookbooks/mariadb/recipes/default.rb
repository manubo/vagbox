include_recipe "mariadb::sources"
include_recipe "mariadb::config"

package "mariadb-server" do
  action :install
end

service "mysql" do
  supports :status => true, :restart => true, "force-reload" => true
  action [:enable, :start]
end