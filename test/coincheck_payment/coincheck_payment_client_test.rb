require 'test_helper'

class CoincheckPaymentTest < Minitest::Test
  def test_payment_button
    cc = CoincheckPayment::Client.new("API KEY", "API SECRET")
    assert_instance_of CoincheckPayment::Client, cc
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
