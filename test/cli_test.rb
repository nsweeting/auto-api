require 'test_helper'
require 'headsail/cli'

class CLITest < Minitest::Test
  def test_new_cli_creates_launcher
    cli = Headsail::CLI.new(['-a', 'test/config/apis.yml'])
    assert cli.launcher
  end
end
