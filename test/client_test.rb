require 'test_helper'
require 'headsail/client'
require 'headsail/api'

class ClientTest < Minitest::Test
  def setup
    stub_request(:any, /.*test.*/).to_rack(FakeAPI)
    api = YAML.load(ERB.new(File.read('test/fixtures/apis.yml')).result).first
    @apis = []
  end

  def test_client_creation
    client = Headsail::Client.new(@apis)
    #client.run
  end
end
