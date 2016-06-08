require 'headsail/task'

module Headsail
  # The main event loop for retrieving data from APIS
  #
  class Client
    def initialize(configure)
      @configure = configure
      @threads = []
      @tasks = []
      setup_tasks
    end

    def run
      @tasks.each { |task| @threads << task.run }
      @threads.map(&:execute)
      Headsail.info('Started up the Headsail Client.')
      loop { sleep 300 }
    end

    private

    def setup_tasks
      @configure.apis.each { |api| @tasks << Task.new(api) }
    end
  end
end
