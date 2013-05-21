#
# Cookbook Name:: apache2
# Spec:: configure_init
#
# Copyright (C) 2013 chef-tutorial
#
# Some rights reserved - Redistribute
#

require 'minitest/spec'

describe_recipe "apache2::configure_init" do

  include MiniTest::Chef::Assertions
  include MiniTest::Chef::Context
  include MiniTest::Chef::Resources

  describe "the init script supports pid as an argument" do
    it "runs /etc/init.d/apache2 pid" do
      `/etc/init.d/apache2 pid`
      assert $?.to_i == 0, "The init script should return the pid of the apache2 process"
    end
    
    it "ensures that the owner and group permission settings are correct for apache2 init script" do
      file("/etc/init.d/apache2").must_exist.with(:owner, "root").and(:group, "root")
    end
  end
end
