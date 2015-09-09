#!/usr/bin/env ruby

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'kempelen'
require 'httparty'

if ARGV.length < 2
  puts "get_account_balance.rb <ACCESS_KEY> <SECRET_KEY>"
  exit
end

@client = Kempelen::API::Client.new(ARGV[0], ARGV[1], :sandbox)
@operation = Kempelen::API::Operations::GetAccountBalance.new(@client)

get_account_balance_response = @operation.perform_operation
puts get_account_balance_response.inspect
