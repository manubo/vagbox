execute "redis_download" do
  cwd "/tmp"
  command "wget #{node[:redis][:download_url]}"
  creates "/tmp/redis-#{node[:redis][:version]}.tar.gz"
  not_if "test -f /usr/local/bin/redis-server"
  notifies :run, "bash[redis_install]", :immediately
end

bash "redis_install" do
    user "root"
    cwd "/tmp"
    code <<-EOH
        tar xvzf redis-#{node[:redis][:version]}.tar.gz
        cd redis-#{node[:redis][:version]}
        make
        cd src && make install
        mkdir -p /usr/local/etc/redis
        cd ..
        rm -rf /tmp/redis-#{node[:redis][:version]}*
    EOH
    only_if "test -f /tmp/redis-#{node[:redis][:version]}.tar.gz"
    action :nothing
end

group "redis" do
    action :create
end

user "redis" do
  comment "Redis user"
  gid "redis"
  shell "/bin/bash"
end

directory "/var/local/redis" do
  owner "redis"
  group "redis"
  mode 0755
  action :create
end

directory "/var/log/redis" do
  owner "redis"
  group "redis"
  mode 0755
  action :create
end

cookbook_file "/usr/local/etc/redis/redis.conf" do
    source "redis.conf"
    mode 0644
    owner "root"
    group "root"
    action :create
end

cookbook_file "/etc/sysctl.conf" do
    source "sysctl.conf"
    mode 0644
    owner "root"
    group "root"
    action :create
    notifies :run, "execute[sysctl_overcommit_memory]", :immediately
end

execute "sysctl_overcommit_memory" do
    user "root"
    command "sudo sysctl vm.overcommit_memory=1"
    action :run
end

cookbook_file "/etc/init.d/redis-server" do
    source "redis-server"
    mode 0755
    owner "root"
    group "root"
    action :create
    notifies :enable, "service[redis-server]", :immediately
    notifies :start, "service[redis-server]", :immediately
end

service "redis-server" do
  supports :start => true, :stop => true, :restart => true
  action :start
end
