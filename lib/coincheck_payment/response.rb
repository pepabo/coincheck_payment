require 'json'

module CoincheckPayment
class Response
  attr_reader :res

  def initialize(res)
    @res = res
    @params = nil
  end

  def code
    @res.code
  end

  def success?
    params["success"]
  end

  def button
    params["button"]
  end

  def params
    @params ||= JSON.parse(@res.body)
  end
end
end
