require 'redis'

module Headsail
  class Redis
    def initialize(key_name)
      @key_name = key_name
      setup_connection
      setup_service
      setup_next_id
    end

    attr_reader :connection

    def add(data)
      @connection.incr(next_id_key)
      @connection.set(new_key, data)
    end

    private

    def new_key
      "#{@key_name}:#{next_id}"
    end

    def next_id
      @connection.get(next_id_key)
    end

    def next_id_key
      @next_id_key ||= "#{@key_name}:next_id"
    end

    def setup_connection
      @connection = ::Redis.new(url: ENV['REDIS_URL'])
    end

    def setup_service
      return if @connection.exists(@key_name)
      @connection.set(@key_name, true)
      @connection.lpush('apis', @key_name)
    end

    def setup_next_id
      @connection.set(next_id_key, 0) unless @connection.exists(next_id_key)
    end
  end
end
