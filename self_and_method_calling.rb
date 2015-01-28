class Test
  def one
    @var = 99
  end

  def two
    puts @var
  end
end

t = Test.new
p t.one