# Person = Struct.new :name, :address, :likes


# class Person
#   def to_s
#     "#{self.name} lives in #{self.address} and likes #{self.likes}"
#   end
# end

class Person < Struct.new(:name, :address, :likes)
  def to_s
    "#{self.name} lives in #{self.address} and likes #{self.likes}"
  end
end

# dave = Person.new "Dave."
dave = Person.new "Dave", "TX"
dave.likes = "Programming Languages"
puts dave
