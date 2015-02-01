packages = %w{ git }
packages.each do |p|
	package p do
		action :install
	end
end