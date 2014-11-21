default[:php5][:extension_dir] = "/usr/lib/php5/#{node[:php5][:libversion]}"

default[:php5][:fpm_conf_dir] = "/etc/php5/fpm"

default[:php5][:cli_conf_dir] = "/etc/php5/cli"