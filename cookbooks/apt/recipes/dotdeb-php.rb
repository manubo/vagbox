include_recipe "apt"

include_recipe "apt::dotdeb-keys";

cookbook_file "/etc/apt/sources.list.d/dotdeb-php.list" do
  mode 0644
  owner "root"
  group "root"
  notifies :run, "bash[dotdeb_keys]", :immediately
  notifies :run, resources(:execute => "apt"), :immediately
end
