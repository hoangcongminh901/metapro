"cat".instance_eval do
  puts "Upper case = #{upcase}"
  puts "Length is #{self.length}"
end

"cat".instance_eval 'puts "Upper=#{upcase}, length=#{self.length}"'