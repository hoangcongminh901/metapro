module AttrLogger
  def attr_logger name
    attr_reader name
    define_method("#{name}=") do |val|
      puts "Assigning #{val.inspect} to #{name}"
      instance_variable_set "@#{name}", val
    end
  end
end

class Example
  extend AttrLogger
  attr_logger :value
end

ex = Example.new
ex.value = 123
puts "value is #{ex.value}"
ex.value = "cat"
puts "value is #{ex.value}"

module GeneralLogger
  #Instance method to be added to any class that includes as
  def log msg
    puts Time.now.strftime("%H:%M: ") + msg
  end
  #module containing class methods to be added
  module ClassMethods
    def attr_logger name
      attr_reader name
      define_method("#{name}=") do |val|
        log "Assigning #{val.inspect} to #{name}"
        instance_variable_set "@#{name}", val
      end
    end
  end

  #extend host class with class methods when we're included
  def self.included host_class
    host_class.extend ClassMethods
  end
end

class Example2
  include GeneralLogger

  attr_logger :value
end

ex = Example2.new
ex.log "New example created"
ex.value = 123
puts "value is #{ex.value}"
ex.value = "cat"
puts "new value is #{ex.value}"