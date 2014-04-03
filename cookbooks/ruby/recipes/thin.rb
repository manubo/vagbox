execute "thin_install" do
  command <<-EOF
gem install thin
thin install
/usr/sbin/update-rc.d -f thin defaults
rvm wrapper #{node[:ruby][:version]}@#{node[:ruby][:gemset]} bootup thin
RVM_PATH="$(dirname `which rvm`)"
sed -i "s|DAEMON=.*|DAEMON=${RVM_PATH}/bootup_thin|" /etc/init.d/thin
EOF
  creates "/usr/local/rvm/gems/ruby-#{node[:ruby][:version]}@#{node[:ruby][:gemset]}/bin/thin"
end