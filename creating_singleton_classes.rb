some_class = Class.new do
  def self.class_method
    puts "In class method"
  end

  def instance_method
    puts "In instance method"
  end
end

some_class.class_method
obj = some_class.new
obj.instance_method

some_class2 = Class.new(String) do
  def vowel_movement
    tr "aeiou", "*"
  end
end

obj2 = some_class2.new "now is the time"
puts obj2.vowel_movement

some_class3 = Class.new
obj3 = some_class3.new
puts "Initial name is #{some_class3.name}"
SomeClass = some_class3
puts "Then the name is #{some_class3.name}"
puts "also works via the object: #{obj3.class.name}"


def MyStruct *keys
  Class.new do
    attr_accessor *keys
    def initialize hash
      hash.each do |key, value|
        instance_variable_set "@#{key}", value
      end
    end
  end
end

Person = MyStruct :name, :address, :likes
dave = Person.new name: "dave", address: "TX", likes: "Stilton"
chad = Person.new name: "chad", likes: "Jazz"
chad.address = "CO"

puts "Dave's name is #{dave.name}"
puts "Chad lives in #{chad.address}"
