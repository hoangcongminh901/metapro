require_relative "refinements"

puts "About to require file using refinement"

require_relative "file_using_refinements"
puts "Back from require"

shout "finished"