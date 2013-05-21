#                                                                                                                                                                       
# Cookbook Name:: apache2
# Spec:: configure
#
# Copyright (C) 2013 chef-tutorial
#
# Some rights reserved - Redistribute
#

require 'minitest/spec'

describe_recipe "apache2::configure" do

  include MiniTest::Chef::Assertions
  include MiniTest::Chef::Context
  include MiniTest::Chef::Resources

  describe "the functionality of the cookbook" do
    it "sets the apache2 ports.conf virtual host port to 8080" do
      file("/etc/apache2/ports.conf").must_include "NameVirtualHost *:8080"
    end

    it "sets the apache2 ports.conf listening port to 8080" do
      file("/etc/apache2/ports.conf").must_include "Listen 8080"
    end

    it "sets the apache2 default virtualhost's listening port to 8080" do
      file("/etc/apache2/sites-available/default").must_include "<VirtualHost *:8080>"
    end

    it "configures the apache2 service to listen on port 8080" do
      `nc -z 10.10.10.5 8080`
      assert $?.exitstatus == 0, "The apache2 service should be listening on port 8080. hint: did you restart the service?"
      #puts "Success. Check 10.10.10.5:8080 in a browser to see apache2 running on port 8080."
    end
    
    it "ensures that the owner and group permission settings are correct for ports.conf" do
      file("/etc/apache2/ports.conf").must_exist.with(:owner, "www-data").and(:group, "www-data")
    end
    
    it "ensures that the owner and group permission settings are correct for default file in sites-available" do
      file("/etc/apache2/sites-available/default").must_exist.with(:owner, "www-data").and(:group, "www-data")
    end

    it "Be DRY: http://en.wikipedia.org/wiki/Don't_repeat_yourself" do
      assert node.apache2.owner == "www-data", "The apache2 cookbook should use the attributes to change the owner to www-data."
      assert node.apache2.group == "www-data", "The apache2 cookbook should use the attributes to change the group to www-data."
    end
  end
end
