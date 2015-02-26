execute "sudo -u vagrant -i rbenv gem install bundler" do 
  action :run
  creates "/home/vagrant/.rbenv/shims/bundler"
end