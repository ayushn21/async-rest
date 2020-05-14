# frozen_string_literal: true

# Copyright, 2018, by Samuel G. D. Williams. <http://www.codeotaku.com>
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

require 'async/http/server'
require 'async/http/endpoint'

require 'async/rest/resource'
require 'async/rest/representation'

module DNS
	class Query < Async::REST::Representation
		def initialize(*arguments)
			# This is the old/weird content-type used by Google's DNS resolver. It's obsolete.
			super(*arguments, wrapper: Async::REST::Wrapper::JSON.new("application/x-javascript"))
		end
		
		def question
			value[:Question]
		end
		
		def answer
			value[:Answer]
		end
	end
end

RSpec.describe Async::REST::Resource do
	include_context Async::RSpec::Reactor
	
	let(:url) {'https://dns.google.com/resolve'}
	subject(:resource) {described_class.for(url)}
	
	it "can get resource" do
		# The first argument is the representation class to use:
		query = resource.get(DNS::Query, name: 'example.com', type: 'AAAA')
		
		expect(query.value).to include(:Question, :Answer)
		
		subject.close
	end
end
