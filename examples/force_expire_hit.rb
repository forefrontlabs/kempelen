#!/usr/bin/env ruby

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'kempelen'
require 'httparty'

if ARGV.length < 3
  puts "force_expire_hit.rb <ACCESS_KEY> <SECRET_KEY> <HIT_ID>"
  exit
end

@client = Kempelen::API::Client.new(ARGV[0], ARGV[1], :sandbox)
@operation = Kempelen::API::Operations::ForceExpireHit.new(@client, ARGV[2])

force_expire_hit_response = @operation.perform_operation
puts force_expire_hit_response.inspect
