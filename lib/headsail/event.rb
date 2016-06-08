require 'logger'

module Headsail
  class Event
    def initialize(event_name)
      @event_name = event_name
      @logger = Logger.new(STDOUT)
    end

    def get_request(http)
      message = "#{@event_name} / GET REQUEST / #{http.code}-#{http.code_status.to_s}"
      @logger.info(message)
    end
  end
end
