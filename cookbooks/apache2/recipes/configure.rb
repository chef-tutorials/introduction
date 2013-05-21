# 
# Cookbook Name:: apache2
# Recipe:: configure
#
# Copyright (C) 2013 chef-tutorial
#
# Some rights reserved - Redistribute
#

template "/etc/apache2/sites-available/default" do
  source "default.erb"
  action :create
  owner node.apache2.owner
  group node.apache2.group
  variables(
    :port => "8080"
  )
  notifies :restart, "service[apache2]"
end

template "/etc/apache2/ports.conf" do
  source "ports.conf.erb"
  action :create
  owner node.apache2.owner
  group node.apache2.group
  variables(
    :port => "8080"
  )
  notifies :restart, "service[apache2]"
end

service "apache2" do
  action :restart
end

