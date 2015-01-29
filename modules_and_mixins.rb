module Logger
  def log msg
    puts Time.now.strftime("%H:%M:%S: ") + "#{self} (#{msg})"
  end
end

class Song
  include Logger
end

s = Song.new
s.log "created"

module Mod
  def greeting # !> previous definition of greeting was here
    "Hello"
  end
end
class Example
  include Mod
end
ex = Example.new
"Before change, greeting is #{ex.greeting}" # => "Before change, greeting is Hello"

module Mod
  def greeting # !> method redefined; discarding old greeting
    "Hi"
  end
end

"After change, greeting is #{ex.greeting}" # => "After change, greeting is Hi"

#prepend
module VanityPuts
  def puts *args
    args.each do |arg|
      super "Dave says: #{arg}"
    end
  end
end

class Object
  prepend VanityPuts
end

puts "Hello and", "goodbye" # => ["Hello and", "goodbye"]

#extend
module Humor
  def tickle
    "#{self} says hee, hee"
  end
end

obj = "Grouchy"
obj.extend Humor
obj.tickle # => "Grouchy says hee, hee"

class Grouchy
  extend Humor
end
Grouchy.tickle # => "Grouchy says hee, hee"
# >> Dave says: goodbye
# >> 11:06:32: #<Song:0x00000001590de8> (created)
# >> Dave says: Hello and
# >> Dave says: goodbye