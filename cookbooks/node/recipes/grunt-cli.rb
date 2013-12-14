execute "npm_grunt_cli" do
    command "npm install -g grunt-cli"
    creates "/usr/local/bin/grunt"
end