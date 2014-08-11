execute "jboss_cleanup" do
    cwd "/tmp"
    command "rm -rf jboss-as-#{node[:jboss][:version]}*"
    action :nothing
end

bash "jboss_install" do
    user "root"
    cwd "/tmp"
    code <<-EOH
        unzip jboss-as-#{node[:jboss][:version]}.zip
        mv jboss-as-#{node[:jboss][:version]} /usr/local/
    EOH
    only_if "test -d /tmp/jboss-as-#{node[:jboss][:version]}.zip"
    action :nothing
    notifies :run, "execute[jboss_cleanup]", :immediately
end

execute "jboss_downlaod" do
    cwd "/tmp"
    command "wget #{node[:jboss][:source]}"
    not_if { File.exists?("/usr/local/bin/jboss-as-#{node[:jboss][:version]}.zip")}
    notifies :run, "bash[jboss_install]", :immediately
end
