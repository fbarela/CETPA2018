#
# Cookbook Name:: cpe_hosts
# Resource:: cpe_hosts
#
# vim: syntax=ruby:expandtab:shiftwidth=2:softtabstop=2:tabstop=2
#
# Copyright (c) 2016-present, Facebook, Inc.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree. An additional grant
# of patent rights can be found in the PATENTS file in the same directory.
#

resource_name :cpe_hosts
default_action :run
action :run do
  HOSTS_FILE = value_for_platform_family(
    'windows' => "#{ENV['WINDIR']}\\System32\\drivers\\etc\\hosts".freeze,
    'default' => '/etc/hosts'.freeze,
  )
  lines = ::File.readlines(HOSTS_FILE)
  chef_managed = lines.select { |x| x.include?('# Chef Managed') }
  if chef_managed && node['cpe_hosts']['manage_by_line']
    require 'English'
    LINE_MARKER = ' # Chef Managed' + $RS
    host_entries = node['cpe_hosts']['extra_entries'].reject do |_k, v|
      v.nil? || v.empty?
    end
    lines = get_user_added_entries(lines)
    unless host_entries.empty?
      host_entries.each do |ip, names|
        entry = ip + ' ' + names.join(' ')
        lines.push(entry + LINE_MARKER)
      end
    end

    # Write out the new `/etc/hosts` file using the normal chef machinery.
    # The defaults for `file` will only write the file if the contents has
    # changed, and will do so atomically.
    file HOSTS_FILE do
      owner root_owner
      group root_group
      mode '0644'
      content lines.join
    end
  else
    template HOSTS_FILE do
      source 'hosts.erb'
      owner root_owner
      group root_group
      mode '0644'
    end
  end
end

def get_user_added_entries(lines)
  excluded_lines = [
    'Generated by Chef',
    'Local modifications will be overwritten',
    'Chef Managed',
  ]
  user_added_entries = []
  lines.each do |line|
    unless excluded_lines.any? { |l| line.include?(l) }
      user_added_entries << line
    end
  end
  user_added_entries
end
