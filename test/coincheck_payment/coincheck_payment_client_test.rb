require 'test_helper'

class CoincheckPaymentClientTest < Minitest::Test
  def test_initialize
    cc = CoincheckPayment::Client.new("API KEY", "API SECRET")
    assert_instance_of CoincheckPayment::Client, cc
  end

  def test_payment_button
    stub_request(:post, "https://coincheck.com/api/ec/buttons").to_return(
      body: %q|{"success":true, "button":{"name":"test"}}|,
      status: 200,
    )

    cc = CoincheckPayment::Client.new("API KEY", "API SECRET")
    res = cc.payment_button({"foo":"bar"})

    assert_instance_of CoincheckPayment::Response, res
    assert_equal "200", res.code
    assert_equal true, res.success?
    assert_equal({"name" => "test"}, res.button)
  end

  def test_generate_header
    cc = CoincheckPayment::Client.new("API KEY", "API SECRET")
    header = cc.generate_header("https://coincheck.com/api/ec/buttons", {
      "foo" => "bar",
    })

    assert_instance_of Hash,         header
    assert_equal "application/json", header["Content-Type"]
    assert_equal "API KEY",          header["ACCESS-KEY"]
    assert_instance_of String,       header["ACCESS-NONCE"]
    assert_instance_of String,       header["ACCESS-SIGNATURE"]
  end
end
