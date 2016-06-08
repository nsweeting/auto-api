require 'headsail/client'

module Headsail
  # Determines the action to be taken based on the Configure object
  #
  class Launcher
    def initialize(configure)
      @configure = configure
    end

    attr_reader :client

    def run
      case
      when @configure.start_client
        start_client
      end
    end

    private

    def start_client
      @client = Client.new(@configure)
      @client.run
    end
  end
end
