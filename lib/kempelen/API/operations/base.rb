require 'date'
require 'hmac-sha1'
require 'digest/sha1'
require 'base64'

module Kempelen
  module API
    module Operations
      class Base
        attr_accessor :client
        attr_accessor :parameters
        attr_accessor :timestamp

        def initialize(client)
          @client = client
          @parameters = {}
        end

        def create_parameters
          @parameters[:service] = client.service_name
          @parameters[:access_key] = client.access_key
          @parameters[:timestamp] = DateTime.now

          string_to_sign = [@parameters[:service], @parameters[:operation], @parameters[:timestamp]].join
          @parameters[:signature] = (Base64.encode64 HMAC::SHA1.digest(client.secret_key, string_to_sign)).strip
        end

        def create_request_string
          create_parameters

          request_str = ""

          @parameters.each do |name, value|
            aws_name = Kempelen::API::Operations::PARAMETERS[name]
            if !aws_name.nil?
              request_str += "&" unless request_str.empty?
              request_str += "#{aws_name}=#{CGI.escape(value.to_s)}"
            else
              aws_name = Kempelen::API::Operations::ARRAY_PARAMETERS[name]
              unless aws_name.nil?
                value.each_index do |idx|
                  hash_value = value[idx]

                  if hash_value.respond_to?(:each)
                    hash_value.each do |k, v|
                      request_str += "&" unless request_str.empty?
                      request_str += "#{aws_name}.#{idx + 1}.#{k}=#{CGI.escape(v.to_s)}"
                    end
                  end
                end
              end
            end
          end

          "#{client.service_url}?#{request_str}"
        end
      end
    end
  end
end
