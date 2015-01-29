require "ostruct"

obj = OpenStruct.new name: "Dave"
obj.address = "Texas"
obj.likes = "Programming"

"#{obj.name} lives in #{obj.address} and likes #{obj.likes}"
# => "Dave lives in Texas and likes Programming"

class MyOpenStruct < BasicObject
  def initialize initial_values={}
    @values = initial_values
  end
  def _singleton_class
    class << self
      self
    end
  end
  def method_missing name, *args, &block
    if name[-1] == "=" # !> shadowing outer local variable - name
      base_name = name[0..-2].intern
      _singleton_class.instance_exec(name) do |name|
        define_method(name) do |value|
          @values[base_name] = value
        end
      end
      @values[base_name] = args[0]
    else # !> shadowing outer local variable - name
      super unless @values.has_key? name
      _singleton_class.instance_exec(name) do |name|
        define_method(name) do
          @values[name]
        end
      end
      @values[name]
    end
  end
end

obj1 = MyOpenStruct.new name: "Dave"
obj1.address = "Texas"
obj1.likes = "Programming"
"#{obj1.name} lives in #{obj1.address} and likes #{obj1.likes}"
# => "Dave lives in Texas and likes Programming"

obj2 = MyOpenStruct.new name: "Dave"
obj2.address = "Texas"

o1 = obj2.dup
o1.name = "Mike" # =>
o1.address = "Colorado"
# ~> -:45:in `<main>': undefined method `name=' for nil:NilClass (NoMethodError)
# ~> -:27:in `method_missing': undefined method `dup' for #<MyOpenStruct:0x0000000279fcf0> (NoMethodError)
# ~>  from -:45:in `<main>'