require 'test_helper'

class CLITest < Minitest::Test
  def setup
    @cli = Headsail::CLI.new(['-a', 'test/config/apis.yml'])
  end

  def test_new_cli_creates_launcher
    assert @cli.launcher.is_a?(Headsail::Launcher)
  end

  def test_new_cli_creates_configure
    assert @cli.configure.is_a?(Headsail::Configure)
  end
end
