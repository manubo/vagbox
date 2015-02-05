packages = %w{ curl zlib1g-dev build-essential libffi-dev libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties }
packages.each do |p|
    package p do
        action :install
    end
end