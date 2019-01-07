require_relative 'toy_robot.rb'
require_relative 'view.rb'
require 'pry-byebug'
require 'pry'

class RobotController
  attr_accessor :horizontal, :vertical, :set_location, :direction, :arr, :moving
  def initialize
    @robot = Robot.new
    @view = RobotView.new
  end

  def place
    get_place_input
    # validation of input (numbers only)
    while (@arr[0].to_i.zero? && (@arr[0] != '0')) || (@arr[1].to_i.zero? && (@arr[1] != '0'))
      puts 'Please select numbers to move horizontally and vertically. Try again.'
      get_place_input
    end
    # validation of input (direction)
    until ['north', 'south', 'east', 'west'].include? @arr[2].downcase
      puts 'Please select a valid direction (North, South, East or West). Try again.'
      get_place_input
    end
    # setting the validated move variables
    @move_horizontal = @arr[0].to_i
    @move_vertical = @arr[1].to_i
    @move_direction = @arr[2].downcase
    # approving the variables to stay on the board
    approve_place
  end

  def move
    if @robot.direction == "east"
      @moving = 1
      approve_horizontal
      report
    elsif @robot.direction == "west"
      @moving = -1
      approve_horizontal
      report
    elsif @robot.direction == "north"
      @moving = 1
      approve_vertical
      report
    elsif @robot.direction == "south"
      @moving = -1
      approve_vertical
      report
    else
      puts "Your robot isn't facing a valid direction. Place your robot and set a direction."
    end
  end

  def left
    if @robot.direction == "north"
      @robot.direction = "west"
      report
    elsif @robot.direction == "east"
      @robot.direction = "north"
      report
    elsif @robot.direction == "south"
      @robot.direction = "east"
      report
    elsif @robot.direction == "west"
      @robot.direction = "south"
      report
    else
      puts "Your robot isn't facing a valid direction. Place your robot and set a direction."
    end
  end

  def right
    if @robot.direction == "north"
      @robot.direction = "east"
      report
    elsif @robot.direction == "east"
      @robot.direction = "south"
      report
    elsif @robot.direction == "south"
      @robot.direction = "west"
      report
    elsif @robot.direction == "west"
      @robot.direction = "north"
      report
    else
      puts "Your robot isn't facing a valid direction. Place your robot and set a direction."
    end
  end

  def report
    @view.location(@robot.horizontal, @robot.vertical, @robot.direction)
  end

  def get_place_input
    @answer = @view.ask_place
    @arr = @answer.split(',').map { |item| item.strip }
  end

  private

  def approve_place
    if @move_horizontal > 4 && @move_vertical > 4
      @view.try_again
      place()
    elsif @move_horizontal > 4
      @view.try_again
      place()
    elsif @move_vertical > 4
      @view.try_again
      place()
    else
      @robot.horizontal = @move_horizontal
      @robot.vertical = @move_vertical
      @robot.direction = @move_direction
      report
    end
  end

  def approve_horizontal
    if (@robot.horizontal + @moving) > 4 || (@robot.horizontal + @moving) < 0
      @view.try_again
    else
      @robot.horizontal += @moving
    end
  end

  def approve_vertical
    if (@robot.vertical + @moving) > 4 || (@robot.vertical + @moving) < 0
      @view.try_again(@robot.direction)
    else
      @robot.vertical += @moving
    end
  end
end
