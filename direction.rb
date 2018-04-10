class Direction
  def initialize(sym, dir_x, dir_y, left, right)
    @name, @dir_x, @dir_y, @left, @right = sym.to_s, dir_x, dir_y, left, right
  end

  def to_s
    @name
  end

  def left
    Direction.const_get(@left)
  end

  def right
    Direction.const_get(@right)
  end

  def advance(x, y)
    [x + @dir_x, y + @dir_y]
  end

  @all = [
    [:EAST,  +1,  0],
    [:NORTH,  0, +1],
    [:WEST,  -1,  0],
    [:SOUTH,  0, -1],
  ]
  @all.each_with_index do |(sym, dir_x, dir_y), i|
    left_dir =  @all[(i + 1) % @all.size].first
    right_dir = @all[(i - 1) % @all.size].first
    self.const_set(sym, Direction.new(sym, dir_x, dir_y, left_dir, right_dir))
  end

  def self.[](name)
    Direction.const_get(name) if Direction.const_defined?(name)
  end
end
