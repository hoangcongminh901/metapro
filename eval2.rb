print ("Enter the name of a string method (e.g. reverse or upcase):")
methodname = STDIN.gets().chomp()
exp2 = "'Hello World'." << methodname
puts eval(exp2)
puts "#{exp2}"
puts "#{eval(exp2)}"