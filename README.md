# Kempelen

[![Circle CI](https://img.shields.io/circleci/project/forefrontlabs/kempelen.svg)](https://circleci.com/gh/forefrontlabs/kempelen/tree/master)
[![Coverage Status](https://coveralls.io/repos/forefrontlabs/kempelen/badge.svg?branch=master&service=github)](https://coveralls.io/github/forefrontlabs/kempelen?branch=master)
[![Code Climate](https://codeclimate.com/github/forefrontlabs/kempelen/badges/gpa.svg)](https://codeclimate.com/github/forefrontlabs/kempelen)
[![Gemnasium](https://img.shields.io/gemnasium/forefrontlabs/kempelen.svg)](https://gemnasium.com/forefrontlabs/kempelen)

Kempelen is a modern Mechanical Turk integration gem.

Note that note all usage cases are covered by this gem at this time.  It is focused on the use cases we needed right now.  More cases will be added in the future.  If you need something right now, feel free to push us a pull request (see Contributing below).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kempelen'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kempelen

## Usage

In general:

  * Create a client
  * Create an operation
  * `result = operation.perform_operation`
  * Work with the result

See the examples directory for some specific examples of usage.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to 
run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new 
version, update the version number in `version.rb`, and then run `bundle exec rake release`, which 
will create a git tag for the version, push git commits and tags, and push the `.gem` file 
to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/forefrontlabs/kempelen](https://gemnasium.com/forefrontlabs/kempelen). 

This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to 
adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

