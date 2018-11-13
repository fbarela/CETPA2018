#
# Cookbook Name:: cpe_helloit
# Recipe:: default
#
# vim: syntax=ruby:expandtab:shiftwidth=2:softtabstop=2:tabstop=2
#
# Copyright (c) 2017-present, Pinterest, Inc.
# All rights reserved.
#
# This source code is licensed under the Apache 2.0 license found in the
# LICENSE file in the root directory of this source tree.
#

return unless node.macos?

cpe_helloit_install 'Install Hello-IT package'
cpe_helloit_profile 'Apply Hello-IT profile'
cpe_helloit_la 'Manage Hello-IT LaunchAgent'
