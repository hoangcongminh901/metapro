class Abc
  def self.addvar aSymbol, aValue
    class_variable_set aSymbol, aValue
  end

  def self.getvar aSymbol
    class_variable_get aSymbol
  end

  def addMethod m, &block
    self.class.send :define_method, m, &block
  end
end

Abc.addvar :@@newvar, 2000
p Abc.getvar :@@newvar
p Abc.class_variables

ob = Abc.new
ob.instance_variable_set "@aname", "Bert"
p ob.instance_variables

ob.addMethod(:xyz){puts "My name is #{@aname}"}
ob.xyz