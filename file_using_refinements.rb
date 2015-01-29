using VanityPuts

puts "I'm in #{File::basename(__FILE__)}"

def shout msg
  puts msg.upcase
end
