require 'concurrent'
require 'headsail/api'
require 'headsail/event'
require 'headsail/http'
require 'headsail/redis'

module Headsail
  class Task
    def initialize(config)
      @api = API.new(config)
      @redis = Redis.new(@api.name)
      @http = HTTP.new(@api)
      @event = Event.new(@api.name)
    end

    def run
      Concurrent::TimerTask.new(execution_interval: @api.timer) do
        @redis.add(@http.body) if @http.run
        @event.request(@http, @api.method)
      end
    end
  end
end
