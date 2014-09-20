bash "tesseract_eng_install" do
	cwd "/tmp"
	code <<-EOF
	wget https://tesseract-ocr.googlecode.com/files/tesseract-ocr-#{node[:tesseract][:lang_version]}.eng.tar.gz
	tar -zxvf tesseract-ocr-#{node[:tesseract][:lang_version]}.eng.tar.gz
	cp tesseract-ocr/tessdata/* /usr/local/share/tessdata/
	EOF
	creates "/usr/local/share/tessdata/eng.cube.bigrams"
	notifies :run, "execute[tesseract_eng_cleanup]", :immediately
end

execute "tesseract_eng_cleanup" do
	cwd "/tmp"
	command "rm -rf tesseract-ocr*"
	action :nothing
end
