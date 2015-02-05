include_recipe "mariadb::sources"
include_recipe "mariadb::service"

package "mariadb-server" do
  action :install
end

package "libmariadbclient-dev" do
  action :install
end

include_recipe "mariadb::user"
include_recipe "mariadb::config"
