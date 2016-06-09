require 'concurrent'
require 'headsail/api'
require 'headsail/http'
require 'headsail/redis'

module Headsail
  class Task
    def initialize(config)
      @api = API.new(config)
      @redis = Redis.new(@api.name)
      @http = HTTP.new(@api)
      Headsail.info("API Task '#{@api.name}' added.")
    end

    def run
      Concurrent::TimerTask.new(execution_interval: @api.timer) do
        @redis.add(@http.body) if @http.run
        request_message
      end
    end

    private

    def request_message
      if @http.code_status == :SUCCESS
        Headsail.info(msg)
      else
        Headsail.err(msg, :no_exit)
      end
    end

    def msg
      "#{@api.name} / #{@api.method} REQUEST / #{@http.code} - #{@http.code_status.to_s}"
    end
  end
end
