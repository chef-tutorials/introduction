#
# Cookbook Name:: postgresql
# Recipe:: configure_init
#
# Copyright (C) 2013 chef-tutorial
#
# Some rights reserved - Redistribute
#

cookbook_file 'place a custom postgresql init script' do
  path '/etc/init.d/postgresql'
  source 'postgresql'
  owner 'root'
  group 'root'
end

