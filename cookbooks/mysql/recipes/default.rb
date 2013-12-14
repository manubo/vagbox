include_recipe "apt::dotdeb"

package "mysql-server" do
  action :install
end

cookbook_file "/etc/mysql/my.cnf" do
  source "my.cnf"
  mode 00644
  owner "root"
  group "root"
end