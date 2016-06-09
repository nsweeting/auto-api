require 'test_helper'
require 'headsail/configure'

class ConfigureTest < Minitest::Test
  def test_load_api_yaml
    config = Headsail::Configure.new
    config.load_apis('test/fixtures/apis.yml')
    assert config.apis.count == 3
  end
end
