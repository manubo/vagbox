# Ubuntu 14 fixes from:
# https://code.google.com/p/tesseract-ocr/wiki/FAQ#Where_are_the_training_tools_for_Ubuntu_14.04_?

#packages = %w{autoconf automake libtool libpng12-dev libjpeg62-dev libtiff4-dev zlib1g-dev libicu-dev libpango1.0-dev libcairo2-dev}
packages = %w{tesseract-ocr libcairo2-dev libpango1.0-dev libicu-dev}
packages.each do |pkg|
	package pkg do
		action :install
	end
end

cookbook_file "/tmp/libtesseract-dev_3.03.03-1_amd64.deb" do
    action :create
    not_if { File.exists? '/usr/bin/mftraining' }
end

cookbook_file "/tmp/libtesseract3_3.03.03-1_amd64.deb" do
    action :create
    not_if { File.exists? '/usr/bin/mftraining' }
end

cookbook_file "/tmp/tesseract-ocr-dev_3.03.03-1_all.deb" do
    action :create
    not_if { File.exists? '/usr/bin/mftraining' }
end

cookbook_file "/tmp/tesseract-ocr_3.03.03-1_amd64.deb" do
    action :create
    not_if { File.exists? '/usr/bin/mftraining' }
end

bash "tesseract_install" do
    cwd "/tmp"
    code <<-EOF
    dpkg -i *.deb
    apt-get install -f
    EOF
    only_if { File.exists? '/tmp/tesseract-ocr_3.03.03-1_amd64.deb' }
    notifies :run, "execute[rm *.deb]", :immediately
end

execute "rm *.deb" do
	cwd "/tmp"
	action :nothing
end