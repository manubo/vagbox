execute "/home/vagrant/.rbenv/bin/rbenv install #{node[:ruby][:version]}" do 
  action :run
  creates "/home/vagrant/.rbenv/versions/#{node[:ruby][:version]}"
end