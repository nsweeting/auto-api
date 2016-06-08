require 'yaml'

module Headsail
  class Configure
    attr_accessor :start_client
    attr_reader :apis

    def load_apis(path)
      @apis = YAML.load_file(path)
    end
  end
end
