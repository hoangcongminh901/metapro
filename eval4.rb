input = ""
until input == "q"
  input = STDIN.gets().chomp()
  if input != "q" then eval(input) end
end
