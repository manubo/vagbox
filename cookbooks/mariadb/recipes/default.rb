include_recipe "mariadb::sources"

package "mariadb-server" do
  action :install
end

include_recipe "mariadb::config"
include_recipe "mariadb::service"
