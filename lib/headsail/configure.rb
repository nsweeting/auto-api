require 'yaml'
require 'erb'

module Headsail
  class Configure
    attr_accessor :start_client
    attr_reader :apis

    def load_apis(path)
      @apis = YAML.load(ERB.new(File.read(path)).result)
      fail if @apis == false
      Headsail.info('Loaded API YAML file.')
    rescue
      Headsail.err('Loading API YAML file.', :exit)
    end
  end
end
