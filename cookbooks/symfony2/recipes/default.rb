execute "install_symfony2" do
	cwd "/srv/www"
  	command "rm -rf * && find ./ -iname \".*\" -type f -exec rm -rf {} \\; && composer create-project symfony/framework-standard-edition /srv/httpd/#{node[:sys][:name]}"
  	creates "/srv/www/web/app.php"
end
