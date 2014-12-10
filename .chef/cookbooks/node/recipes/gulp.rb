execute "npm_gulp" do
    command "npm install -g gulp"
    creates "/usr/local/bin/gulp"
end