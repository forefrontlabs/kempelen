require 'test_helper'

class KempelenTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Kempelen::VERSION
  end

  def test_it_does_not_something_useful
    assert false
  end

  def test_it_does_something_useful
    assert true
  end
end
