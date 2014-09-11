cookbook_file "/etc/apt/sources.list.d/ondrej-php5-5_6-trusty.list" do
    mode 00644
    owner "root"
    group "root"
    notifies :run, "execute[ppa_php5_register_key]", :immediately
end

execute "ppa_php5_register_key" do
	command "apt-key adv --recv-key --keyserver keyserver.ubuntu.com E5267A6C"
	action :nothing
	notifies :run, "execute[apt_update]", :immediately
end

execute "apt_update" do
	command "apt-get update && apt-key update"
	action :nothing
end