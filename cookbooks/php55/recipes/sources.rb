include_recipe "apt"

cookbook_file "/etc/apt/sources.list.d/dotdeb-php55.list" do
  source "dotdeb-php55.list"
  mode 0644
  owner "root"
  group "root"
  notifies :run, resources(:execute => "apt"), :immediately
end