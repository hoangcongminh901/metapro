proc_obj = Proc.new{|a| a}
p proc_obj
p proc_obj.call 1

def what_class obj
  case obj
  when proc{|x| x.kind_of? String}
    String
  when proc{|x| x.kind_of? Numeric}
    Numeric
  else
    Class
  end
end

p what_class "string"
p what_class 1
p what_class []

def convert_proc &block
  block
end

proc_obj = convert_proc{1}
p proc_obj.call

def proc_return
  Proc.new{return 1; puts :unreachable}.call
  :unreachable
end

p proc_return

# Proc.new{return 1; puts :unreachable}.call

p lambda{return 1; puts :unreachable}.call

p lambda{return 1; puts :unreachable}.call

def lamba_return
  lambda{return 1; puts :unreachable}.call
  :unreachable
end

p lamba_return