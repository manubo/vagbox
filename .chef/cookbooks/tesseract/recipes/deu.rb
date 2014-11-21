bash "tesseract_deu_install" do
	cwd "/tmp"
	code <<-EOF
	wget https://tesseract-ocr.googlecode.com/files/tesseract-ocr-#{node[:tesseract][:lang_version]}.deu.tar.gz
	tar -zxvf tesseract-ocr-#{node[:tesseract][:lang_version]}.deu.tar.gz
	cp tesseract-ocr/tessdata/* /usr/local/share/tessdata/
	EOF
	creates "/usr/local/share/tessdata/deu.cube.bigrams"
	notifies :run, "execute[tesseract_deu_cleanup]", :immediately
end

execute "tesseract_deu_cleanup" do
	cwd "/tmp"
	command "rm -rf tesseract-ocr*"
	action :nothing
end
