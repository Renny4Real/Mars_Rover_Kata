class Rover

  def initialize(x_coordinate,y_coordinate, orientation)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @orientation = orientation
    @axis = {x: @x_coordinate, y: @y_coordinate, direction: @orientation}
  end

  def position
    @axis
  end

  def move(*movement_commands)
    movement_commands.each do |movement_command|
      movement = movement_command[0]
      spaces = movement_command[1]
      turn = movement_command[2]
      @axis[:y] += spaces if movement == 'f' && @axis.has_value?(:S)
      @axis[:y] -= spaces if movement == 'b' && @axis.has_value?(:S)
      @axis
    end
    @axis
  end

  def turn(chirality)
    if chirality == 'l' && @axis.has_value?(:S)
      @axis[:direction] = :E
    elsif chirality == 'l' && @axis.has_value?(:E)
      @axis[:direction] = :N
    elsif chirality == 'l' && @axis.has_value?(:N)
      @axis[:direction] = :W
    elsif chirality == 'l' && @axis.has_value?(:W)
      @axis[:direction] = :S
    end
  end

end
