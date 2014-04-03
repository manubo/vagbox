include_recipe "tools"

execute "rvm_install" do
    command <<-EOF
curl -sSL https://get.rvm.io | bash -s stable
echo "alias sudo=rvmsudo" >> ~/.profile
echo 'PATH="$PATH:/usr/local/rvm/bin"' >> ~/.profile
echo "export rvmsudo_secure_path=1" >> ~/.profile
EOF
    creates "/usr/local/rvm/bin/rvm"
end

execute "ruby_install" do
    command "rvm install #{node[:ruby][:version]}"
    creates "/usr/local/rvm/rubies/ruby-#{node[:ruby][:version]}/bin/ruby"
end

execute "rvm_gemset" do
    command <<-EOF
rvm gemset create "#{node[:ruby][:gemset]}"
rvm gemset use "#{node[:ruby][:gemset]}"
EOF
    creates "/usr/local/rvm/gems/ruby-#{node[:ruby][:version]}@#{node[:ruby][:gemset]}"
end

