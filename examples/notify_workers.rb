#!/usr/bin/env ruby

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'kempelen'
require 'httparty'

if ARGV.length < 3
  puts "notify_workers.rb <ACCESS_KEY> <SECRET_KEY> <WORKER_ID> <SUBJECT> <MESSAGE>"
  exit
end

@client = Kempelen::API::Client.new(ARGV[0], ARGV[1], :sandbox)
@operation = Kempelen::API::Operations::NotifyWorkers.new(@client, [ARGV[2]], "Test Message", "This is a test message")

result = @operation.perform_operation
puts result.inspect
