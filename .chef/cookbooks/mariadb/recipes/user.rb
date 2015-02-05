execute "create_root_user" do
  command "mysql -uroot -e \"CREATE USER 'root'@'%'; GRANT ALL PRIVILEGES ON *.* TO 'root'@'%'; FLUSH PRIVILEGES;\""
  action :run
end