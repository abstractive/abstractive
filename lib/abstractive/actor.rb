require 'abstractive'
require 'celluloid/current'

class Abstractive::Actor

  include Celluloid

  def console(message, options={})
    if @logger
      @logger.console(message, options.merge(local: true))
    else
      plain_output("#{mark}#{message}")
    end
  rescue
    plain_output("#{mark}#{message}")
  end

  def debug(message)
    console(message, level: :debug)
  end

  def exception(ex, message)
    if @logger
      @logger.exception(ex, message)
    else
      plain_output("(#{ex.class}) #{ex.message}: #{message}")
    end
  rescue
    plain_output("(#{ex.class}) #{ex.message}: #{message}")
  ensure
    plain_output("(#{ex.class}) #{ex.message}: #{message}")
  end

  def plain_output(message)
    message = "*, [#{Time.now.strftime('%FT%T.%L')}] #{mark}#{message}"
    STDERR.puts message
    STDOUT.puts message
  end

  def pretty_output object
    puts JSON.pretty_generate(object)
  end

end




