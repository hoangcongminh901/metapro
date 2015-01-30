a = <<EOS
def aMethod x
  return x*2
end

num = 100
puts "This is the result of the calculation:"
puts aMethod num
EOS
eval a