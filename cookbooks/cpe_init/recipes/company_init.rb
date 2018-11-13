#
# Cookbook Name:: cpe_init
# Recipe:: company_init
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

# HERE: This is where you would set attributes that are consumed by the API
# cookbooks.
# Be sure to replace all instances of MYCOMPANY with your actual company name

node.default['organization'] = 'CETPA'
prefix = "com.#{node['organization']}.chef"
node.default['cpe_launchd']['prefix'] = prefix
node.default['cpe_profiles']['prefix'] = prefix

#node.default['cpe_loginwindow']['LoginwindowText'] = 'Property of Parlier Unified School District'

#node.default['cpe_desktop']['override-picture-path'] = '/Library/Desktop Pictures/Mojave Night.jpg'

#node.default['cpe_preferencepanes']['DisabledPreferencePanes'] = [
#  'com.apple.preference.desktopscreeneffect',
#  'com.apple.preferences.icloud',
#  'com.apple.preferences.configurationprofiles'
#]


#node.default['cpe_dock']['tilesize'] = 64
# Do not allow user to change icon size
#node.default['cpe_dock']['size-immutable'] = true
# Do not merge with user's dock
#node.default['cpe_dock']['static-only'] = true
# Do not allow user to override add items to dock
#node.default['cpe_dock']['contents-immutable'] = true
# Dock Orientation
# Set dock orientation (bottom, left, right)
#node.default['cpe_dock']['orientation'] = 'right'
# Do not allow user to change dock orientation
#node.default['cpe_dock']['position-immutable'] = true


#node.default['cpe_profiles']['com.CETPA.chef.wifi']={
#    "PayloadIdentifier"        => "com.CETPA.chef",
#    "PayloadRemovalDisallowed" => true,
#    "PayloadScope"             => "System",
#    "PayloadType"              => "Configuration",
#    "PayloadUUID"              => "48a39070-1e4c-0131-c321-000c2944c108",
#    "PayloadOrganization"      => "PUSD WLAN",
#    "PayloadVersion"           => 1,
#    "PayloadDisplayName"       => "WiFi",
#    "PayloadContent"           => [
#      {
#        "PayloadType"          => "com.apple.wifi.managed",
#        "PayloadVersion"       => 1,
#        "PayloadIdentifier"    => "com.CETPA.chef.wifi",
#        "PayloadUUID"          => "2872c4d0-1e56-0231-c329-000c2944c108",
#        "PayloadEnabled"       => true,
#        "PayloadDisplayName"   => "WiFi",
#        "HIDDEN_NETWORK"       => false,
#        "ProxyType"            => "None",
#        "EncryptionType"       => "WPA",
#        "SetupModes"           => [],
#        "AuthenticationMethod" => "",
#        "Interface"            => "BuiltInWireless",
#        "SSID_STR"             => "PUSD_WLAN",
#        "Password"             => "MySecretPassword1"
#      }
#    ]
#  }
