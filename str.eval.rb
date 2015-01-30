aStr = "hello world"
puts "#{aStr}"
puts "#{2*10}"
"#{def x(s)
     puts(s.reverse)
   end;
(1..3).each{x(aStr)}}"

exp = STDIN.gets().chomp()
puts eval(exp)
puts "#{exp}"