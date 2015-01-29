class Base
  def a_method
    puts "Got here"
  end
  private :a_method
end

class Derived1 < Base
  public :a_method
end

class Derived2 < Base
end

# class Derived1 < Base
#   public :a_method
# end

# is effectively the same as this:

# class Derived1 < Base
#   def a_method *
#     super
#   end
#   public :a_method
# end

# The call to super can access the parent's method regardless of its visibility