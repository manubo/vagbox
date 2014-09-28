if (node[:mariadb][:is_first])

  service "mysql" do
    supports :status => true, :restart => true, "force-reload" => true
    start_command "/etc/init.d/mysql start --wsrep-new-cluster"
    restart_command "/etc/init.d/mysql restart --wsrep-new-cluster"
    action :start
  end

else 

  service "mysql" do
    supports :status => true, :restart => true, "force-reload" => true
    action :start
  end

end