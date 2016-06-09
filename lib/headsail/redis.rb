require 'redis'

module Headsail
  class Redis
    attr_reader :connection

    def initialize(key_name)
      @key_name = key_name
      setup_connection
      setup_task
    end

    def add(data)
      @connection.lpush(@key_name, data)
    rescue
      setup_connection
    end

    private

    def setup_connection
      @connection = ::Redis.new(url: ENV['REDIS_URL'])
      @connection.ping
    rescue
      Headsail.err("Failed to connect to Redis server at ENV 'REDIS_URL'.", :exit)
    end

    def setup_task
      @connection.sadd('apis', @key_name)
    end
  end
end
