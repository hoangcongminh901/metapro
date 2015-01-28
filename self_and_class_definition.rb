class Test1
  puts "In the definition of class Test"
  puts "self = #{self}"
  puts "Class of self = #{self.class}"
end

class Test2
  @var = 99
  def self.value_of_var
    @var
  end
end
p Test2.value_of_var