module X

end

class Y
  @@x = 10
  include X
end

X::module_eval{define_method(:xyz){puts "hello"}}
Y::class_eval{define_method(:abc){puts "hello, hello"}}

ob = Y.new
ob.xyz
ob.abc
Y.class_eval "@@x"