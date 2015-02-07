include_recipe "mariadb::sources"
include_recipe "mariadb::service"
include_recipe "mariadb::user"

package "mariadb-server" do
  action :install
  notifies :run, "execute[create_root_user]", :immediately
end

package "libmariadbclient-dev" do
  action :install
end

include_recipe "mariadb::config"
