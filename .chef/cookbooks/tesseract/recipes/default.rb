packages = %w{autoconf automake libtool libpng12-dev libjpeg62-dev libtiff4-dev zlib1g-dev libleptonica-dev}

packages.each do |pkg|
	package pkg do
		action :install
	end
end

bash "tesseract_install" do
	cwd "/tmp"
	code <<-EOF
	wget https://tesseract-ocr.googlecode.com/files/tesseract-ocr-#{node[:tesseract][:version]}.tar.gz
	tar -zxvf tesseract-ocr-#{node[:tesseract][:version]}.tar.gz
	cd tesseract-ocr
	./autgen.sh
	./configure
	make
	make install
	ldconfig
	echo "export TESSDATA_PREFIX=/usr/local/share/" >> ~/.dots/exports
	EOF
	creates "/usr/local/bin/tesseract"
	notifies :run, "execute[tesseract_cleanup]", :immediately
end

execute "tesseract_cleanup" do
	cwd "/tmp"
	command "rm -rf tesseract-ocr*"
	action :nothing
end