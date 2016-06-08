module Headsail
  class HTTP
    def initialize(api)
      @api = api
      @response = nil
    end

    attr_reader :response

    def get
      @response = Net::HTTP.get_response(@api.get)
      code_status == :success
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
        :success
      when (400..499)
        :bad_request
      when (500..599)
        :server_problems
      end
    end
  end
end
