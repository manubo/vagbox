cookbook_file "/etc/mysql/conf.d/mariadb.cnf" do
  source "mariadb.cnf"
  mode 0644
  owner "root"
  group "root"
end