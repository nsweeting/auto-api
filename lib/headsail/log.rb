module Headsail
  STDOUT.sync = true

  def self.log
    @logger ||= build_logger
  end

  def self.info(msg)
    log.info("[ \e[32mINFO\e[0m ] #{msg}")
  end

  def self.err(msg, action)
    log.info("[ \e[31mERROR\e[0m ] #{msg}")
    exit 1 if action == :exit
  end

  def self.build_logger
    logger = Logger.new(STDOUT)
    logger.formatter = proc do |_severity, _datetime, _progname, msg|
      "#{msg}\n"
    end
    logger
  end
end
