execute "nodejs_cleanup" do
    cwd "/tmp"
    command "rm -rf node"
    action :nothing
end

bash "nodejs_install" do
    user "root"
    cwd "/tmp/node"
    code <<-EOH
        git checkout #{node[:node][:version]}
        ./configure
        make
        make install
    EOH
    only_if "test -d /tmp/node"
    action :nothing
    notifies :run, "execute[nodejs_cleanup]", :immediately
end

execute "nodejs_clone" do
    cwd "/tmp"
    command "git clone https://github.com/joyent/node.git"
    not_if { File.exists?("/usr/local/bin/node") }
    notifies :run, "bash[nodejs_install]", :immediately
end
