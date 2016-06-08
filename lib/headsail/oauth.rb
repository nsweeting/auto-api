require 'oauth'

module Headsail
  class OAuth
    attr_reader :access_token

    def initialize(oauth)
      return false if oauth.nil?
      @oauth = oauth
      @access_token = oauth_token
    end

    private

    def oauth_token
      ::OAuth::AccessToken.new(consumer, @oauth['access_token'], @oauth['access_token_secret'])
    end

    def consumer
      ::OAuth::Consumer.new(@oauth['consumer_key'], @oauth['consumer_secret'], site: @oauth['site'])
    end
  end
end
