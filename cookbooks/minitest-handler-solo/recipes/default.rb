include_recipe 'chef_handler'

chef_gem 'minitest-chef-handler' do
  action :nothing
end.run_action(:install)

require 'minitest-chef-handler'

chef_handler 'MiniTest::Chef::Handler' do
  source 'minitest-chef-handler'
end
