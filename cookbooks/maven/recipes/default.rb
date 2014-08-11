execute "maven_cleanup" do
    cwd "/tmp"
    command "rm -rf apache-maven-#{node[:maven][:version]}-bin*"
    action :nothing
end

bash "maven_install" do
    user "root"
    cwd "/tmp"
    code <<-EOH
        unzip apache-maven-#{node[:maven][:version]}-bin.zip
        mv apache-maven-#{node[:maven][:version]}-bin /usr/local/
    EOH
    only_if "test -d /tmp/apache-maven-#{node[:maven][:version]}-bin.zip"
    action :nothing
    notifies :run, "execute[maven_cleanup]", :immediately
end

execute "maven_downlaod" do
    cwd "/tmp"
    command "wget #{node[:maven][:source]}"
    not_if { File.exists?("/usr/local/bin/apache-maven-#{node[:maven][:version]}-bin.zip")}
    notifies :run, "bash[maven_install]", :immediately
end
