require 'test_helper'
require 'headsail/redis'

class RedisTest < Minitest::Test
  def test_new_data_added
    redis = Headsail::Redis.new('test')
    assert redis.add('value')
  end
end
