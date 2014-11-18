include_recipe "python::setuptools"

package "python-pip" do
  action :install
end