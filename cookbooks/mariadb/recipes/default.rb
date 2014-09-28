include_recipe "mariadb::sources"

package "mariadb-server" do
  action :install
end