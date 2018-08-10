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
    turn_left if chirality == 'l' 
    turn_right if chirality == 'r' 
  end

  private
  
  def turn_left
    case @axis[:direction]
    when :S
      @axis[:direction] = :E
    when :E
      @axis[:direction] = :N
    when :N
      @axis[:direction] = :W
    when :W
      @axis[:direction] = :S
    else
      @axis
    end
  end

  def turn_right
    case @axis[:direction]
    when :S
      @axis[:direction] = :W
    when :W
      @axis[:direction] = :N
    when :N
      @axis[:direction] = :E
    when :E
      @axis[:direction] = :S
    else
      @axis
    end
  end

end


