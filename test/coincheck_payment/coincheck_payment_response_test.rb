require 'test_helper'

class CoincheckPaymentResponseTest < Minitest::Test
  RESPONSE_HASH = <<-'EOS'
  {
    "success": true,
    "button": {
      "foo": "bar"
    }
  }
  EOS

  def test_initialize
    res = TestResponse.new(200, RESPONSE_HASH)
    cr = CoincheckPayment::Response.new(res)
    assert_instance_of CoincheckPayment::Response, cr
  end

  def test_code
    res = TestResponse.new(200, RESPONSE_HASH)
    cr = CoincheckPayment::Response.new(res)
    assert_equal 200, cr.code
  end

  def test_params
    res = TestResponse.new(200, RESPONSE_HASH)
    cr = CoincheckPayment::Response.new(res)
    assert_equal JSON.parse(RESPONSE_HASH), cr.params
  end

  def test_success?
    res = TestResponse.new(200, RESPONSE_HASH)
    cr = CoincheckPayment::Response.new(res)
    assert_equal true, cr.success?
  end

  def test_button
    res = TestResponse.new(200, RESPONSE_HASH)
    cr = CoincheckPayment::Response.new(res)
    assert_instance_of Hash, cr.button
    assert_equal "bar", cr.button["foo"]
  end
end
