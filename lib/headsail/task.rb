require 'concurrent'
require 'headsail/api'
require 'headsail/event'
require 'headsail/http'
require 'headsail/redis'

module Headsail
  class Task
    attr_reader :redis, :http, :api, :event

    def initialize(config)
      @api = API.new(config)
      @redis = Redis.new(@api.name)
      @http = HTTP.new(@api)
      @event = Event.new(@api.name)
      @request = determine_request
    end

    def run
      Concurrent::TimerTask.new(execution_interval: api.timer) do
        send(@request)
      end
    end

    private

    def determine_request
      case
      when api.get
        :get_task
      end
    end

    def get_task
      redis.add(http.body) if http.get
      event.get_request(http)
    end
  end
end
