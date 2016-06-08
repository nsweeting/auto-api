require 'yaml'

module Headsail
  class Configure
    attr_accessor :start_client
    attr_reader :apis

    def load_apis(path)
      @apis = YAML.load_file(path)
      Headsail.info('Loaded API YAML file.')
    rescue
      Headsail.error('Loaded API YAML file.')
    end
  end
end
