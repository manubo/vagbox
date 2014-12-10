execute "nodejs_setup" do
    cwd "/tmp"
    command "curl -sL https://deb.nodesource.com/setup | sudo bash -"
    not_if { File.exists? 'usr/bin/nodejs' }
    notifies :install, "package[nodejs]", :immediately
end

package "nodejs" do 
    action :nothing
end
