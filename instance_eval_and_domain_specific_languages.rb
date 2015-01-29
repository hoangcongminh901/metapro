class Turtle
  def left

  end
  def right

  end
  def forward n

  end
  def pen_up

  end
  def pen_down

  end
  def walk &block
    instance_eval &block
  end
  def draw

  end
end

turtle = Turtle.new
turtle.walk do
  3.times do
    forward(8)
    pen_down
    4.times do
      forward(4)
      left
    end
    pen_up
  end
end
