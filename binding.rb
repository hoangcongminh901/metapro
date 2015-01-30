def getBinding str
  return binding()
end

str = "hello"
puts eval "str + 'Fred'"
puts eval "str + 'Fred'", getBinding("bye")