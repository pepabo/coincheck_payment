# CoincheckPayment

Ruby implementation of Coincheck Payment API client.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'coincheck_payment'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install coincheck_payment

## Usage

### Retrieval of Payment Button

First, you should retrieve a payment button. 

```ruby
require 'coincheck_payment'

client = CoincheckPayment::Client.new("YOUR API KEY", "YOUR API SECRET")

## Retrieve a button for payment
button = client.payment_button(params)
```

### Handling a Request to Callback URL

The API sends request(s) to the callback URL you set in `callback_url` field of the request above to notify transaction status. The status can be one of below.

  1. User just paid but the transaction is not confirmed
  2. The transaction is confirmed in the Bitcoin network

```ruby
# ...
```

### Handling a Payment Error

The API sends a request to the callback URL you set in `notify_mispayment` field of the request above to notify a transaction error.

```ruby
# ...
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pepabo/coincheck_payment.

## Author

[Kentaro Kuribahyashi](https://kentarok.org/)

## License

Copyright (c) 2017 [GMO Pepabo, Inc.](https://pepabo.com/)

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
