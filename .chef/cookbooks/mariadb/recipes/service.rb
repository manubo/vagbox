if (node[:mariadb][:is_first])

  print "STARTING WITH wsrep-new-cluster"
  service "mysql" do
    supports :status => true, :restart => true, "force-reload" => true
    start_command "/etc/init.d/mysql start --wsrep-new-cluster"
    restart_command "/etc/init.d/mysql restart --wsrep-new-cluster"
    action :nothing
  end

else 

  print "STARTING WITHOUT wsrep-new-cluster"
  service "mysql" do
    supports :status => true, :restart => true, "force-reload" => true
    action :nothing
  end

end