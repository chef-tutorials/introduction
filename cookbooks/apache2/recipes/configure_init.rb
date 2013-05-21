#
# Cookbook Name:: apache2
# Recipe:: configure_init
#
# Copyright (C) 2013 chef-tutorial
#
# Some rights reserved - Redistribute
#

cookbook_file 'place a custom apache2 init script' do
  path '/etc/init.d/apache2'
  source 'apache2'
  owner 'root'
  group 'root'
end

