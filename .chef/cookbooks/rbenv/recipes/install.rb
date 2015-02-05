execute "/home/vagrant/.rbenv/bin/rbenv install #{node[:ruby][:version]}" do 
  action :run
end