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
  end

# place the robot on the table using the validated user input
  def place(x, y, dir)
    # setting the validated move variables
    @move_horizontal = x
    @move_vertical = y
    @move_direction = dir
    # approving the variables to make sure robot stays on the board
    approve_place
    @placed = true
    return
  end

# method to check that the placed robot will stay on the board
  def approve_place
    if (@move_horizontal > 4 && @move_vertical > 4) || @move_horizontal > 4 || @move_vertical > 4
      return "Ba-Bow...You can't move beyond the edge, you are trying to move too far."
    else
      @horizontal = @move_horizontal
      @vertical = @move_vertical
      @direction = @move_direction
    end
  end

# moving the robot one unit in the direction it faces
  def move
  # check that the robot is placed before executing move method
    return "You must first place your robot on the board!" if @placed == false
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
      return "Your robot isn't facing a valid direction. Place your robot and set a direction."
    end
  end

  def left
  # check that the robot is placed before executing move method
    return "You must first place your robot on the board!" if @placed == false
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
      return "Your robot isn't facing a valid direction. Place your robot and set a direction."
    end
  end

  def right
  # check that the robot is placed before executing move method
    return "You must first place your robot on the board!" if @placed == false
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
      return "Your robot isn't facing a valid direction. Place your robot and set a direction."
    end
  end

# check that the move method doesn't push the robot off the board horizontally
  def approve_horizontal
    if (@horizontal + @moving) > 4 || (@horizontal + @moving) < 0
      return "Ba-Bow...You can't move beyond the edge, you are trying to move too far."
    else
      @horizontal += @moving
      return
    end
  end

# check that the move method doesn't push the robot off the board vertically
  def approve_vertical
    if (@vertical + @moving) > 4 || (@vertical + @moving) < 0
      return "Ba-Bow...You can't move beyond the edge, you are trying to move too far."
    else
      @vertical += @moving
      return
    end
  end

# report method to display the robots location
  def report
  # check robot is placed prior to executing
    if @placed == false
      return "You must first place your robot on the board!"
    else
      return "You are located at horizontal #{@horizontal} and vertical #{@vertical} facing #{@direction}."
    end
  end
end
