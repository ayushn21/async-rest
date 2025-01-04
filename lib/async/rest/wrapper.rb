# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2018-2024, by Samuel Williams.

module Async
  module REST
    module Wrapper
      autoload :Form,         "async/rest/wrapper/form"
      autoload :JSON,         "async/rest/wrapper/json"
      autoload :URLEncoded,   "async/rest/wrapper/url_encoded"
    end
  end
end