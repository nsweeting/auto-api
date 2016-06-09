$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'headsail'

require 'byebug'
require 'minitest/autorun'
require 'webmock/minitest'
require 'sinatra/base'

class FakeAPI < Sinatra::Base
  get '/todos' do
    get_response 'todos.json'
  end

  get '/server_problem' do
    status 500
  end

  not_found do
    status 404
  end

  private

  def get_response(filename, status_code = 200)
    content_type :json
    status status_code
    load_fixture(filename)
  end

  def load_fixture(filename)
    File.open(File.join('test/fixtures', filename), 'r').read
  end
end
