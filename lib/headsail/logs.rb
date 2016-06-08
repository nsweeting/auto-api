module Headsail
  STDOUT.sync = true

  def self.log
    @logger ||= build_logger
  end

  def self.info(msg)
    log.info("[ \e[32m#{'INFO'}\e[0m ] #{msg}")
  end

  def self.err(msg)
    log.info("[ \e[31m#{'ERROR'}\e[0m ] #{msg}")
  end

  def self.build_logger
    logger = Logger.new(STDOUT)
    logger.formatter = proc do |severity, datetime, progname, msg|
      "#{msg}\n"
    end
    logger
  end
end
