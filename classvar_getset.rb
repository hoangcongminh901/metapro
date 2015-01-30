class Abc
  def self.addvar aSymbol, aValue
    class_variable_set aSymbol, aValue
  end

  def self.getvar aSymbol
    class_variable_get aSymbol
  end
end

Abc.addvar :@@newvar, 2000
p Abc.getvar :@@newvar