execute "sudo -u vagrant -i rbenv install #{node[:ruby][:version]}" do 
  action :run
  creates "/home/vagrant/.rbenv/versions/#{node[:ruby][:version]}"
end