bash "dotdeb_keys" do
  code <<-EOF
wget http://www.dotdeb.org/dotdeb.gpg
cat dotdeb.gpg | sudo apt-key add -
EOF
  action :nothing
end