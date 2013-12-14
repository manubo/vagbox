include_recipe "apt"

cookbook_file "/etc/apt/sources.list" do
  source "sources.list"
  mode 0644
  owner "root"
  group "root"
  notifies :run, resources(:execute => "apt"), :immediately
end