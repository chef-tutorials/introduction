#                                                                                                                                                                       
# Cookbook Name:: postgresql
# Spec:: install
#
# Copyright (C) 2013 chef-tutorial
#
# Some rights reserved - Redistribute
#

require 'minitest/spec'

describe_recipe "postgresql::install" do

  include MiniTest::Chef::Assertions
  include MiniTest::Chef::Context
  include MiniTest::Chef::Resources

  describe "the functionality of the cookbook" do
    it "installs the postgresql package" do
      package("postgresql").must_be_installed
    end
  end
end
