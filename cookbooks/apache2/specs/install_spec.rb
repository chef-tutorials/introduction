#                                                                                                                                                                       
# Cookbook Name:: apache2
# Spec:: install
#
# Copyright (C) 2013 chef-tutorial
#
# Some rights reserved - Redistribute
#

require 'minitest/spec'

describe_recipe "apache2::install" do

  include MiniTest::Chef::Assertions
  include MiniTest::Chef::Context
  include MiniTest::Chef::Resources

  describe "the functionality of the cookbook" do
    it "installs the apache2 package" do
      package("apache2").must_be_installed
      #puts "Success. Check 10.10.10.5 in a browser to see apache2 running."
    end
  end
end
