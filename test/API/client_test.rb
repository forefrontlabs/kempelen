require 'test_helper'

class ClientTest < Minitest::Test
  def test_initialization
    client = Kempelen::API::Client.new("A", "B", "sandbox")

    assert_equal "A", client.access_key
    assert_equal "B", client.secret_key
    assert_equal :sandbox, client.environment
  end

  def test_that_production_is_the_default_environment
    client = Kempelen::API::Client.new("A", "B")

    assert_equal :production, client.environment
  end

  def test_that_staging_can_be_accessed
    client = Kempelen::API::Client.new("A", "B", "sandbox")

    assert_equal :sandbox, client.environment
  end

  def test_that_environment_symbols_also_work
    client = Kempelen::API::Client.new("A", "B", :sandbox)

    assert_equal :sandbox, client.environment
  end

  def test_that_it_raises_an_error_on_invalid_environment
    assert_raises(ArgumentError) { Kempelen::API::Client.new("A", "B", "monkey") }
  end

  def test_that_changing_environments_changes_service_urls
    client = Kempelen::API::Client.new("A", "B", :sandbox)

    assert_equal Kempelen::API::Client::SERVICE_URLS[:sandbox], client.service_url

    client = Kempelen::API::Client.new("A", "B", :production)

    assert_equal Kempelen::API::Client::SERVICE_URLS[:production], client.service_url
  end

  def test_service_name
    client = Kempelen::API::Client.new("A", "B", :production)
   
    assert_equal Kempelen::API::Client::SERVICE_NAME, client.service_name
  end
end
