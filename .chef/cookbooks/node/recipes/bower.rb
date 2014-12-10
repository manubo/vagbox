execute "npm_bower" do
    command "npm install -g bower"
    creates "/usr/bin/bower"
end