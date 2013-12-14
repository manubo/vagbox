include_recipe "apt"

bash "dotdeb_keys" do
  code <<-EOF
wget http://www.dotdeb.org/dotdeb.gpg
cat dotdeb.gpg | sudo apt-key add -
EOF
  action :nothing
end

cookbook_file "/etc/apt/sources.list.d/dotdeb.list" do
  source "dotdeb.list"
  mode 0644
  owner "root"
  group "root"
  notifies :run, "bash[dotdeb_keys]", :immediately
  notifies :run, resources(:execute => "apt"), :immediately
end
