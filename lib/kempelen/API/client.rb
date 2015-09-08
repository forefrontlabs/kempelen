module Kempelen
  module API
    class Client
      # Amazon AWS access key.
      attr_reader :access_key

      # Secret key for AWS access key. Used to sign the requests.
      attr_reader :secret_key

      # Mechanical Turk environment to make API calls to - defaults to :production.
      attr_reader :environment

      # URLs for Mechanical Turk APIs, indexed by environment.
      SERVICE_URLS = {
        sandbox: 'https://mechanicalturk.sandbox.amazonaws.com'.freeze,
        production: 'https://mechanicalturk.amazonaws.com'.freeze
      }

      # Service name of the Mechanical Turk API.
      SERVICE_NAME = "AWSMechanicalTurkRequester".freeze

      def initialize(access_key, secret_key, environment = :production) 
        @access_key = access_key
        @secret_key = secret_key

        @environment = environment.to_sym

        raise ArgumentError.new("Unknown environment".freeze) if SERVICE_URLS[@environment].nil?
      end

      def service_name
        SERVICE_NAME
      end

      def service_url
        SERVICE_URLS[@environment]
      end
    end
  end
end
