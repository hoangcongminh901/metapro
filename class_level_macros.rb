class Logger
  def self.add_logging
    def log msg
      STDERR.puts Time.now.strftime("%H:%M:%S: ") + "#{self} (#{msg})"
    end
  end
  add_logging
end

class Example < Logger
  add_logging
end

ex = Example.new
ex.log "hello"