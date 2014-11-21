default[:elasticsearch][:version] = "0.90.10"
default[:elasticsearch][:package] = "elasticsearch-#{node[:elasticsearch][:version]}.deb"
default[:elasticsearch][:download] = "https://download.elasticsearch.org/elasticsearch/elasticsearch/#{node[:elasticsearch][:package]}"
