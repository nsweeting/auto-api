require 'test_helper'
require 'headsail/api'

class APITest < Minitest::Test
  def setup
    @apis = YAML.load(ERB.new(File.read('test/config/apis.yml')).result)
    @api = Headsail::API.new(@apis.first)
  end

  def test_name_is_set
    assert @api.name == @apis.first['name']
  end

  def test_timer_is_set
    assert @api.timer == @apis.first['timer']
  end

  def test_uri_is_set
    assert @api.uri.is_a?(URI)
  end
end
