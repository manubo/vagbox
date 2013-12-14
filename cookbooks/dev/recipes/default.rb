include_recipe "apt-update"

execute "ldconfig" do
end

package "build-essential" do
  action :install
end

package "cmake" do
  action :install
end

package "libaio-dev" do
  action :install
end

package "openssl" do
  action :install
end

package "libssl-dev" do
  action :install
end