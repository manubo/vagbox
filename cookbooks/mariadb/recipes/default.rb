include_recipe "mariadb::sources"
include_recipe "mariadb::config"

package "mariadb-server" do
  action :install
end