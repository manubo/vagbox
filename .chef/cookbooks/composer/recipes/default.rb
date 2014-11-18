execute "composer_install" do
  cwd "/tmp"
  command <<-EOF
curl -s https://getcomposer.org/installer | php && 
mv ./composer.phar /usr/local/bin/composer
EOF
  creates "/usr/local/bin/composer"
end

execute "composer self-update" do
  action :run
end