require 'pry-byebug'
require 'pry'

# Robot to execute the movements on the board

class Robot
  attr_accessor :horizontal, :vertical, :direction, :placed
  def initialize
    @horizontal = 0
    @vertical = 0
    @direction = ""
    @placed = false
    @not_placed_error = "You must first place your robot on the board!"
    @off_board_error = "Ba-Bow...You can't move beyond the edge, you are trying to move too far."
    @no_direction_error = "Error: Your robot doesn't have a valid direction. Please place your robot again."
  end

# place the robot on the table using the validated user input
  def place(x, y, dir)
  # approving the variables to make sure robot stays on the board
    if (x > 4 && y > 4) || x > 4 || y > 4
      return @off_board_error
    else
      @horizontal = x
      @vertical = y
      @direction = dir
      @placed = true
    end
    return
  end

# moving the robot one unit in the direction it faces
  def move
  # check that the robot is placed before executing move method
    return @not_placed_error if @placed == false
  #executing move method using the robots direction
    if @direction == "east"
      @moving = 1
      approve_horizontal
    elsif @direction == "west"
      @moving = -1
      approve_horizontal
    elsif @direction == "north"
      @moving = 1
      approve_vertical
    elsif @direction == "south"
      @moving = -1
      approve_vertical
    else
      return @no_direction_error
    end
  end

  def left
  # check that the robot is placed before executing move method
    return @not_placed_error if @placed == false
  #executing left method using the robots direction
    if @direction == "north"
      @direction = "west"
      return
    elsif @direction == "east"
      @direction = "north"
      return
    elsif @direction == "south"
      @direction = "east"
      return
    elsif @direction == "west"
      @direction = "south"
      return
    else
      return @no_direction_error
    end
  end

  def right
  # check that the robot is placed before executing move method
    return @not_placed_error if @placed == false
  #executing right method using the robots direction
    if @direction == "north"
      @direction = "east"
      return
    elsif @direction == "east"
      @direction = "south"
      return
    elsif @direction == "south"
      @direction = "west"
      return
    elsif @direction == "west"
      @direction = "north"
      return
    else
      return @no_direction_error
    end
  end

# check that the move method doesn't push the robot off the board horizontally
  def approve_horizontal
    if (@horizontal + @moving) > 4 || (@horizontal + @moving) < 0
      return @off_board_error
    else
      @horizontal += @moving
      return
    end
  end

# check that the move method doesn't push the robot off the board vertically
  def approve_vertical
    if (@vertical + @moving) > 4 || (@vertical + @moving) < 0
      return @off_board_error
    else
      @vertical += @moving
      return
    end
  end

# report method to display the robots location
  def report
  # check robot is placed prior to executing
    if @placed == false
      return @not_placed_error
    else
      return "You are located at X: #{@horizontal} and Y: #{@vertical} facing #{@direction}."
    end
  end
end
