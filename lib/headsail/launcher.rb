require 'headsail/client'

module Headsail
  # Determines the action to be taken based on the Configure object
  #
  class Launcher
    attr_reader :client

    def initialize(configure)
      @configure = configure
    end

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
