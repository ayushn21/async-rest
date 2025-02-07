# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2023-2024, by Samuel Williams.

require "async/rest/a_wrapper"
require "async/rest/wrapper/json"

describe Async::REST::Wrapper::JSON do
	let(:wrapper) {subject.new}
	
	it_behaves_like Async::REST::AWrapper
end
