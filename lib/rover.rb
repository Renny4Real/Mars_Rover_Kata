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
      relevant_move_sequence(movement, spaces)
    end
  end

  def turn(chirality)
    turn_left if chirality == :left
    turn_right if chirality == :right
  end

  private

  def relevant_move_sequence(movement, spaces)
    move_north(movement, spaces)
    move_south(movement, spaces)
    move_east(movement, spaces)
    move_left(movement, spaces)
  end

  def move_north(movement, spaces)
    @axis[:y] -= spaces if movement == :forward && @axis.value?(:North)
    @axis[:y] += spaces if movement == :backward && @axis.value?(:North)
  end

  def move_south(movement, spaces)
    @axis[:y] += spaces if movement == :forward && @axis.value?(:South)
    @axis[:y] -= spaces if movement == :backward && @axis.value?(:South)
  end

  def move_east(movement, spaces)
    @axis[:x] += spaces if movement == :forward && @axis.value?(:East)
    @axis[:x] -= spaces if movement == :backward && @axis.value?(:East)
  end

  def move_left(movement, spaces)
    @axis[:x] -= spaces if movement == :forward && @axis.value?(:West)
    @axis[:x] += spaces if movement == :backward && @axis.value?(:West)
  end

  def turn_left
    case @axis[:direction]
    when :South
      @axis[:direction] = :East
    when :East
      @axis[:direction] = :North
    when :North
      @axis[:direction] = :West
    when :West
      @axis[:direction] = :South
    end
  end

  def turn_right
    case @axis[:direction]
    when :South
      @axis[:direction] = :West
    when :West
      @axis[:direction] = :North
    when :North
      @axis[:direction] = :East
    when :East
      @axis[:direction] = :South
    end
  end
end
