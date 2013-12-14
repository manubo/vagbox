packages = %w{bzip2 libbz2-dev curl vim git sendmail-bin sendmail}

packages.each do |pkg|
	package pkg do
		action :install
	end
end