#                                                                                                                                                                       
# Cookbook Name:: postgresql
# Recipe:: configure
#
# Copyright (C) 2013 chef-tutorial
#
# Some rights reserved - Redistribute
#

template "/etc/postgresql/9.1/main/postgresql.conf" do
  source "postgresql.conf.erb"
  action :create
  variables(
    :port => "9999"
  )
  notifies :restart, "service[postgresql]"
end

service "postgresql" do
  action :restart
end
