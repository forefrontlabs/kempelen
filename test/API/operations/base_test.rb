require 'test_helper'

class BaseOperationTest < Minitest::Test
  def setup
    @client = Kempelen::API::Client.new("A", "B", :sandbox)
    @base_operation = Kempelen::API::Operations::Base.new(@client)
  end

  def test_initialization
    assert_equal @client, @base_operation.client
    assert_kind_of Hash, @base_operation.parameters 
    assert_empty @base_operation.parameters
  end

  def test_create_parameters
    @base_operation.create_parameters

    assert_equal @client.service_name, @base_operation.parameters[:service]
    assert_equal @client.access_key, @base_operation.parameters[:access_key]
    refute_nil @base_operation.parameters[:timestamp]
    refute_nil @base_operation.parameters[:signature]
  end

  def test_create_request_string_will_create_required_parameters
    assert_nil @base_operation.parameters[:signature]

    request_string = @base_operation.create_request_string

    refute_nil @base_operation.parameters[:signature]
    assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:service])
    assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:access_key])
    assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:timestamp])
    assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:signature])
  end

  def test_create_request_unknown_parameters_should_be_dropped
    @base_operation.parameters[:monkey_dog_cat] = 1

    request_string = @base_operation.create_request_string

    assert request_string.include?(Kempelen::API::Operations::PARAMETERS[:signature])
    refute request_string.include?('monkey_dog_cat')
  end

  def test_create_request_string_produces_valid_url
    request_string = @base_operation.create_request_string
    client_uri = URI(@client.service_url)
    request_uri = URI(request_string)
    parameters = CGI::parse(request_uri.query)

    assert_equal request_string, request_uri.to_s
    assert_equal client_uri.scheme, request_uri.scheme
    assert_equal client_uri.host, request_uri.host

    assert_equal @base_operation.parameters[:signature], 
      parameters[Kempelen::API::Operations::PARAMETERS[:signature]].first
    assert_equal @base_operation.parameters[:service], 
      parameters[Kempelen::API::Operations::PARAMETERS[:service]].first
    assert_equal @base_operation.parameters[:timestamp].to_s, 
      parameters[Kempelen::API::Operations::PARAMETERS[:timestamp]].first
    assert_equal @base_operation.parameters[:access_key], 
      parameters[Kempelen::API::Operations::PARAMETERS[:access_key]].first
  end

  def test_create_request_string_handles_array_parameters
    @base_operation.parameters[:layout_parameters] = [{Name: 'foo', Value: 'bar'}]

    request_string = @base_operation.create_request_string

    request_uri = URI(request_string)
    parameters = CGI::parse(request_uri.query)

    parameter_key = Kempelen::API::Operations::ARRAY_PARAMETERS[:layout_parameters]
    assert_equal 'foo', parameters["#{parameter_key}.1.Name"].first
    assert_equal 'bar', parameters["#{parameter_key}.1.Value"].first
  end
end
