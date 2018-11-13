#
# Cookbook Name:: cpe_deprecation_notifier
# Recipe:: default
#
# Copyright (c) 2016-present, Facebook, Inc.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree. An additional grant
# of patent rights can be found in the PATENTS file in the same directory.
#
return unless node.macos?

cpe_deprecation_notifier 'Managed Deprecation Notifier'
