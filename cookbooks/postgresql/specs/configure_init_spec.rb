#
# Cookbook Name:: postgresql
# Spec:: configure_init
#
# Copyright (C) 2013 chef-tutorial
#
# Some rights reserved - Redistribute
#

require 'minitest/spec'

describe_recipe "postgresql::configure_init" do

  include MiniTest::Chef::Assertions
  include MiniTest::Chef::Context
  include MiniTest::Chef::Resources

  describe "the function of the custom init script" do
    it "the init script supports pid as an argument" do
      `/etc/init.d/postgresql pid`
      assert $?.to_i == 0, "The init script should return the pid of the postgres process"
    end

    it "ensures that the owner and group permission settings are correct for postgresql init script" do
      file("/etc/init.d/postgresql").must_exist.with(:owner, "root").and(:group, "root")
    end
  end
end
