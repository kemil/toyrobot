module Commands
  def place(x, y, face)
    validate(x = (x.to_i),
             y = (y.to_i),
             face = Direction[face.upcase])
    @x, @y, @face = x, y, face
  end

  def move
    raise InvalidCommand.new unless @face
    new_x, new_y = @face.advance(@x, @y)
    validate(new_x, new_y, @face)
    @x, @y = new_x, new_y
  end

  def left
    raise InvalidCommand.new unless @face
    @face = @face.left
  end

  def right
    raise InvalidCommand.new unless @face
    @face = @face.right
  end

  def report
    raise InvalidCommand.new unless @face
    @output.puts "#{@x},#{@y},#{@face}"
  end
end
