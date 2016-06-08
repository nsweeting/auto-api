require 'test_helper'
require 'headsail/config'

class ConfigTest < Minitest::Test
  def test_load_api_yaml
    config = Headsail::Config.new
    config.load_apis('test/config/apis.yml')
    assert config.apis.count == 2
  end
end
