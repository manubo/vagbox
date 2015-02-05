include_recipe "rbenv::packages"

git "/home/vagrant/.rbenv" do
  user "vagrant"
  group "vagrant"
  repository "https://github.com/sstephenson/rbenv.git"
  action :checkout
  not_if { File.exist?("/home/vagrant/.rbenv") }
  notifies :run, "bash[rbenv_configure]", :immediately
end

bash "rbenv_configure" do
  user "vagrant"
  not_if "grep RBENV_VERSION /home/vagrant/.profile"
  code <<-EOH
  echo 'export RBENV_VERSION="#{node[:ruby][:version]}"' >> /home/vagrant/.profile
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /home/vagrant/.profile
  echo 'eval "$(rbenv init -)"' >> /home/vagrant/.profile
  EOH
  action :nothing
end

directory "/home/vagrant/.rbenv/plugins" do
  owner "vagrant"
  group "vagrant"
  mode "0755"
  action :create
  notifies :checkout, "git[/home/vagrant/.rbenv/plugins/ruby-build]", :immediately
end

git "/home/vagrant/.rbenv/plugins/ruby-build" do
  user "vagrant"
  group "vagrant"
  repository "https://github.com/sstephenson/ruby-build.git"
  action :nothing
  notifies :run, "execute[ruby_build_install]", :immediately
end

execute "ruby_build_install" do
  cwd "/home/vagrant/.rbenv/plugins/ruby-build"
  command "/home/vagrant/.rbenv/plugins/ruby-build/install.sh"
  action :nothing
end
