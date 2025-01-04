# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2018-2024, by Samuel Williams.

module Async
  module REST
    module Wrapper
      autoload :Form,         "#{__dir__}/wrapper/form"
      autoload :JSON,         "#{__dir__}/wrapper/json"
      autoload :URLEncoded,   "#{__dir__}/wrapper/url_encoded"
    end
  end
end