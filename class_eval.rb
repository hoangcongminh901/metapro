class MyClass

end

MyClass.class_eval do
  def instance_method
    puts "in an instance method"
  end
end
obj = MyClass.new
obj.instance_method

MyClass.instance_eval do
  def class_method
    puts "In a class method"
  end
end
MyClass.class_method