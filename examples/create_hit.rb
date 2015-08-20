#!/usr/bin/env ruby

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'kempelen'
require 'httparty'

if ARGV.length < 4
  puts "create_hit.rb <ACCESS_KEY> <SECRET_KEY> <HIT_TYPE_ID> <LAYOUT_ID>"
  exit
end

@client = Kempelen::API::Client.new(ARGV[0], ARGV[1], :sandbox)

@operation = Kempelen::API::Operations::CreateHit.new(@client, ARGV[2], 3600) do |op|
  op.layout_id = ARGV[3]
  op.add_layout_parameter "link", "http://alt-usage-english.org/can_a_cat_man.wav"
end

response = HTTParty.get(@operation.create_request_string, debug_output: $stdout)
puts response.parsed_response
