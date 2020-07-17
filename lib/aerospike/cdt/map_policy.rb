# encoding: utf-8
# Copyright 2016-2020 Aerospike, Inc.
#
# Portions may be licensed to Aerospike, Inc. under one or more contributor
# license agreements.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not
# use this file except in compliance with the License. You may obtain a copy of
# the License at http:#www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations under
# the License.

module Aerospike
  module CDT
    class MapPolicy

      attr_accessor :order, :write_mode, :flags

      def initialize(order: nil, write_mode: nil, flags: nil)
        if write_mode && flags
          raise ArgumentError, "Use write mode for server versions < 4.3; use write flags for server versions >= 4.3."
        end

        @order = order || MapOrder::DEFAULT
        @write_mode = write_mode || MapWriteMode::DEFAULT
        @flags = flags || MapWriteFlags::DEFAULT
      end

      DEFAULT = MapPolicy.new

    end
  end
end
