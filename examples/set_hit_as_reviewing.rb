#!/usr/bin/env ruby

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'kempelen'
require 'httparty'

if ARGV.length < 3
  puts "set_hit_as_reviewing.rb <ACCESS_KEY> <SECRET_KEY> <HIT_ID>"
  exit
end

@client = Kempelen::API::Client.new(ARGV[0], ARGV[1], :sandbox)
@operation = Kempelen::API::Operations::SetHitAsReviewing.new(@client, ARGV[2])

set_hit_as_reviewing = @operation.perform_operation
puts set_hit_as_reviewing.inspect
