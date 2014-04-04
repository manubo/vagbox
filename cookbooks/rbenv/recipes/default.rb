include_recipe "tools"

execute "rbenv_install" do
    command <<-EOF
git clone https://github.com/sstephenson/rbenv.git /home/vagrant/.rbenv
echo "\n\n# rbenv settings" >> /home/vagrant/.zshrc
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /home/vagrant/.zshrc
echo 'eval "$(rbenv init -)"' >> /home/vagrant/.zshrc
EOF
    creates "/home/vagrant/.rbenv"
end

execute "ruby-build_install" do
    command <<-EOF
git clone https://github.com/sstephenson/ruby-build.git /home/vagrant/.rbenv/plugins/ruby-build
EOF
    creates "/home/vagrant/.rbenv/plugins/ruby-build"
end

execute "rbenv_cleanup" do
    command <<-EOF
chown -R vagrant:vagrant /home/vagrant/.rbenv
EOF
end

