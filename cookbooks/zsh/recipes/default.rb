package "zsh" do
    action :install
    notifies :run, "execute[zsh_enable]", :immediately
end

execute "dotfiles_download" do
    command <<-EOF
git clone https://github.com/manubo/dotfiles.git /home/vagrant/.dots
chown -R vagrant:vagrant /home/vagrant/.dots
EOF
end

cookbook_file "zshrc" do
  source "zshrc"
  path "/home/vagrant/.zshrc"
  owner "vagrant"
  group "vagrant"
  mode "0644"
end

cookbook_file "zshrc" do
  source "zshrc"
  path "/root/.zshrc"
  owner "root"
  group "root"
  mode "0644"
end

execute "zsh_enable" do
    command <<-EOF
chsh -s /bin/zsh vagrant
chsh -s /bin/zsh root
EOF
    action :nothing
end