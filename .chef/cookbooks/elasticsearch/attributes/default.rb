default[:elasticsearch][:version] = "1.4.0"
default[:elasticsearch][:package] = "elasticsearch-#{node[:elasticsearch][:version]}.deb"
default[:elasticsearch][:download] = "https://download.elasticsearch.org/elasticsearch/elasticsearch/#{node[:elasticsearch][:package]}"
