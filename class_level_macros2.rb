class Logger
  def self.add_logging id_string
    define_method(:log) do |msg|
      now = Time.now.strftime "%H:%M:%S"
      STDERR.puts "#{now}-#{id_string}: #{self} (#{msg})"
    end
  end
end

class Song < Logger
  add_logging "Tune"
end

class Album < Logger
  add_logging "CD"
end

song = Song.new
song.log "rock on"

class AttrLogger
  def self.attr_logger name
    attr_reader name
    define_method("#{name}=") do |val|
      puts "Assigning #{val.inspect} to #{name}"
      instance_variable_set "@#{name}", val
    end
  end
end

class Example < AttrLogger
  attr_logger :value
end

ex = Example.new
ex.value = 123
puts "Value is #{ex.value}"
ex.value = "cat"
puts "Value is #{ex.value}"