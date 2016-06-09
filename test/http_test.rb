require 'test_helper'
require 'headsail/http'

class HTTPTest < Minitest::Test
  def setup
    stub_request(:any, /.*test.*/).to_rack(FakeAPI)
    @apis = YAML.load(ERB.new(File.read('test/fixtures/apis.yml')).result)
    @api = Headsail::API.new(@apis.first)
    @http = Headsail::HTTP.new(@api)
    @http.run
  end

  def test_get_request
    assert @http.run
  end

  def test_get_request_returns_todo
    json = JSON.parse(@http.body)
    assert json['todos']
  end

  def test_response_code
    assert @http.code == '200'
    assert @http.code_status == :SUCCESS
  end

  def test_bad_request
    api = Headsail::API.new(@apis[1])
    http = Headsail::HTTP.new(api)
    assert http.run == false
    assert http.code == '404'
    assert http.code_status == :BAD_REQUEST
  end

  def test_server_problems
    api = Headsail::API.new(@apis[2])
    http = Headsail::HTTP.new(api)
    assert http.run == false
    assert http.code == '500'
    assert http.code_status == :SERVER_PROBLEMS
  end
end
