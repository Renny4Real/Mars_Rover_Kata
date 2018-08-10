# frozen_string_literal: true

class Rover
  def initialize(x_coordinate, y_coordinate, orientation)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @orientation = orientation
    @axis = { x: @x_coordinate, y: @y_coordinate, direction: @orientation }
  end

  def position
    @axis
  end

  def move(*movement_commands)
    movement_commands.each do |movement_command|
      movement = movement_command[0]
      spaces = movement_command[1]
      relevant_move_sequence(spaces, movement)
    end
    @axis
  end

  def turn(chirality)
    turn_left if chirality == 'l'
    turn_right if chirality == 'r'
  end

  private

  def relevant_move_sequence(spaces, movement)
    move_north?(spaces, movement)
    move_south?(spaces, movement)
    move_east?(spaces, movement)
    move_left?(spaces, movement)
  end

  def move_north?(spaces, movement)
    @axis[:y] -= spaces if movement == 'f' && @axis.value?(:N)
    @axis[:y] += spaces if movement == 'b' && @axis.value?(:N)
  end

  def move_south?(spaces, movement)
    @axis[:y] += spaces if movement == 'f' && @axis.value?(:S)
    @axis[:y] -= spaces if movement == 'b' && @axis.value?(:S)
  end

  def move_east?(spaces, movement)
    @axis[:x] += spaces if movement == 'f' && @axis.value?(:E)
    @axis[:x] -= spaces if movement == 'b' && @axis.value?(:E)
  end

  def move_left?(spaces, movement)
    @axis[:x] -= spaces if movement == 'f' && @axis.value?(:W)
    @axis[:x] += spaces if movement == 'b' && @axis.value?(:W)
  end

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
