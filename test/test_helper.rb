$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'coincheck_payment'

require 'minitest/autorun'
require 'webmock/minitest'

class TestResponse
  attr_reader :code, :body
  def initialize(code, body)
    @code = code
    @body = body
  end
end
