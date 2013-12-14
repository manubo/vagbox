include_recipe "apt"

execute "ldconfig" do
end

packages = %w{build-essential cmake libaio-dev openssl libssl-dev}

packages.each do |pkg|
	package pkg do
		action :install
	end
end