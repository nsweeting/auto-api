module Headsail
  def self.log
    @logger ||= Logger.new(STDOUT)
  end

  def self.info(msg)
    log.info("[ \e[32m#{'OK'}\e[0m ] #{msg}")
  end

  def self.err(msg)
    log.info("[ \e[31m#{'ERR'}\e[0m ] #{msg}")
  end
end
