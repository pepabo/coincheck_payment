require "json"
require "openssl"

module CoincheckPayment
class Client
  attr_reader :api_key, :api_secret

  def initialize(api_key, api_secret)
    @api_key = api_key
    @api_secret = api_secret
  end

  def payment_button(params)

  end

  def generate_header(url, params)
    nonce     = Time.now.to_i.to_s
    message   = nonce + url + params.to_json
    signature = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new("sha256"), @api_secret, message)

    {
      "Content-Type"     => "application/json",
      "ACCESS-KEY"       => @api_key,
      "ACCESS-NONCE"     => nonce,
      "ACCESS-SIGNATURE" => signature
    }
  end
end
end