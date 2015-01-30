class Abc
  def y
    puts "ymethod"
  end
end

print "Enter a class name: "
cname = STDIN.gets().chomp
ob = Object.const_get(cname).new
p ob
print "Enter a method to be called: "
mname = STDIN.gets().chomp
ob.method(mname).call