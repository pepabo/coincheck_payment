require "json"
require 'net/http'
require "openssl"
require 'uri'

module CoincheckPayment
class Client
  attr_reader :api_key, :api_secret

  def initialize(api_key, api_secret)
    @api_key = api_key
    @api_secret = api_secret
  end

  def payment_button(params)
    uri = URI.parse("https://coincheck.com/api/ec/buttons")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    req = Net::HTTP::Post.new(uri.request_uri)
    req.body = params.to_json

    generate_header(uri, params).each do |k, v|
      req[k] = v
    end

    Response.new(http.request(req))
  end

  def generate_header(uri, params)
    nonce     = Time.now.to_i.to_s
    message   = nonce + uri.to_s + params.to_json
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
