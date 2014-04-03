execute "rails_install" do
  command <<-EOF
gem install rails --no-doc --no-ri
EOF
  creates "/usr/local/bin/composer"
end
