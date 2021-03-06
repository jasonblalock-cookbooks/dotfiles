#
# Cookbook Name:: dotfiles
# Recipe:: default
#
# Copyright (c) 2016 Jason Blalock, All Rights Reserved.

include_recipe 'git_ppa::default'

username = node['dotfiles']['user']

git "/home/#{username}/.dotfiles" do
  repository node['dotfiles']['git']['repo']
  revision node['dotfiles']['git']['revision']
  action :sync
  user username
  group username
  environment 'HOME' => "/home/#{username}"
  only_if { "getent passwd #{username}" && File.exists?("/home/#{username}") }
end
