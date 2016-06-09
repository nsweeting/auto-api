module Headsail
  class API
    attr_reader :name, :timer, :method, :uri, :oauth

    def initialize(config)
      @name = config['name']
      @timer = config['timer'].to_i
      @oauth = config['oauth']
      @method = config['request']['method']
      @uri = build_uri(config['request'])
    rescue
      Headsail.err('Improper API YAML format.', :exit)
    end

    private

    def build_uri(request)
      return false if request.nil?
      uri_full = URI(request['uri'])
      uri_full.query = URI.encode_www_form(request['params']) if request['params']
      uri_full
    end
  end
end
