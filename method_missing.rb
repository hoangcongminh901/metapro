def method_missing name, *args, &block
  puts "called #{name} with #{args.inspect} and #{block}"
end

wibble # => nil
wobble 1,2 # => nil
wurble(3,4){stuff} # => nil
# >> called wibble with [] and
# >> called to_ary with [] and
# >> called to_str with [] and
# >> called wobble with [1, 2] and
# >> called to_ary with [] and
# >> called to_str with [] and
# >> called wurble with [3, 4] and #<Proc:0x0000000264b7c8@-:7>
# >> called to_ary with [] and
# >> called to_str with [] and

class MyClass < OtherClass
  def method_missing name, *args, &block
    if <some condition>
      #handle call
    else
      super # otherwise pass it on
    end
  end
end