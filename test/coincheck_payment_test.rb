require 'test_helper'

class CoincheckPaymentTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::CoincheckPayment::VERSION
  end

  def test_payment_button
    cc = CoincheckPayment.new("API KEY", "API SECRET")
    assert !cc.nil?
  end
end
