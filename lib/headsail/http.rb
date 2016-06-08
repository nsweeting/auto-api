require 'headsail/oauth'

module Headsail
  class HTTP
    attr_reader :response

    def initialize(api)
      @api = api
      @response = nil
      @oauth = determine_oauth
      @request = determine_request
    end

    def run
      send(@request)
    end

    def body
      @response.body
    end

    def code
      @response.code
    end

    def code_status
      case @response.code.to_i
      when 200 || 201
        :SUCCESS
      when (400..499)
        :BAD_REQUEST
      when (500..599)
        :SERVER_PROBLEMS
      end
    end

    private

    def get_request_no_oauth
      @response = Net::HTTP.get_response(@api.uri)
      code_status == :SUCCESS
    end

    def get_request_with_oauth
      @response = @oauth.access_token.get(@api.uri.to_s)
      code_status == :SUCCESS
    end

    def determine_request
      case
      when @api.method == 'GET' && @oauth
        :get_request_with_oauth
      when @api.method == 'GET' && @oauth == false
        :get_request_no_oauth
      end
    end

    def determine_oauth
      @api.oauth ? OAuth.new(@api.oauth) : false
    end
  end
end
