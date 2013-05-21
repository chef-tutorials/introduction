#                                                                                                                                                                       
# Cookbook Name:: postgresql
# Spec:: configure
#
# Copyright (C) 2013 chef-tutorial
#
# Some rights reserved - Redistribute
#

require 'minitest/spec'

describe_recipe "postgresql::configure" do

  include MiniTest::Chef::Assertions
  include MiniTest::Chef::Context
  include MiniTest::Chef::Resources

  describe "the functionality of the cookbook" do
    it "configures postgresql" do
      file("/etc/postgresql/9.1/main/postgresql.conf").must_exist
    end
    
    it "sets the postgresql service's listening port to 9999" do
      file("/etc/postgresql/9.1/main/postgresql.conf").must_include "port = 9999"
    end

    it "configures postgresql service to listen on port 9999" do
      `nc -z 10.10.10.5 9999`
      assert $?.exitstatus == 0, "The postgresql service should be listening on port 9999. hint: did you restart the service?"
    end

    it "ensures that the owner and group permission settings are correct for postgresql.conf" do
      file("/etc/postgresql/9.1/main/postgresql.conf").must_exist.with(:owner, "postgres").and(:group, "postgres")
    end
    it "Be DRY: http://en.wikipedia.org/wiki/Don't_repeat_yourself" do
      assert node.postgresql.owner == "postgres", "The postgresql cookbook should use the attributes to change the owner to postgres."
      assert node.postgresql.group == "postgres", "The postgresql cookbook should use the attributes to change the group to postgres."
    end
 end
end
