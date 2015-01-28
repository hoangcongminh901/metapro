animal = "dog"
def animal.speak
  puts "The #{self} says WOOF!"
end

singleton = class << animal
  def lie
    puts "The #{self} lies down"
  end
  self
end

animal.speak
animal.lie
puts "singleton class object is #{singleton}"
puts "It defines methods #{singleton.instance_methods - "cat".methods}"

class Test
  @var = 99
  class << self
    attr_accessor :var
  end
end

puts "Original value = #{Test.var}"
Test.var = "cat"
puts "new value = #{Test.var}"