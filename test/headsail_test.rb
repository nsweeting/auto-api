require 'test_helper'

class HeadsailTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Headsail::VERSION
  end
end
