require 'rspec/autorun'
require 'pry-byebug'
require 'pry'

# PROGRAM

class Robot
  attr_accessor :horizontal, :vertical, :direction, :moving
  def initialize
    @horizontal = 0
    @vertical = 0
    @direction = ""
    @placed = false
  end

  def place(x, y, dir)
    # setting the validated move variables
    @move_horizontal = x
    @move_vertical = y
    @move_direction = dir
    # approving the variables to stay on the board
    approve_place
    @placed = true
    return
  end

  def approve_place
    if (@move_horizontal > 4 && @move_vertical > 4) || @move_horizontal > 4 || @move_vertical > 4
      return "Ba-Bow...You can't move beyond the edge, you are trying to move too far."
    else
      @horizontal = @move_horizontal
      @vertical = @move_vertical
      @direction = @move_direction
    end
  end

  def move
    if @placed == false
      return "You must first place your robot on the board!"
    end
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
    if @placed == false
      return "You must first place your robot on the board!"
    end
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
    if @placed == false
      return "You must first place your robot on the board!"
    end
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

  def approve_horizontal
    if (@horizontal + @moving) > 4 || (@horizontal + @moving) < 0
      return "Ba-Bow...You can't move beyond the edge, you are trying to move too far."
    else
      @horizontal += @moving
      return
    end
  end

  def approve_vertical
    if (@vertical + @moving) > 4 || (@vertical + @moving) < 0
      return "Ba-Bow...You can't move beyond the edge, you are trying to move too far."
    else
      @vertical += @moving
      return
    end
  end

  def report
    if @placed == false
      return "You must first place your robot on the board!"
    else
      return "You are located at horizontal #{@horizontal} and vertical #{@vertical} facing #{@direction}."
    end
  end

end

# Testing program
  # @robot = Robot.new
  # puts @robot.vertical
  # puts @robot.move
  # puts @robot.direction


# RSPEC TESTING
describe Robot do
  before(:each) do
    @robot = Robot.new
  end

  it "can initialize a robot" do
    expect(@robot).to be_a(Robot)
  end

  it "robot has to be placed on the table before any other commands" do
    expect(@robot.place).to eq false
  end

  it "initializes robot at the origin (0,0) with no direction" do
    expect(@robot.horizontal).to eq(0)
    expect(@robot.vertical).to eq(0)
    expect(@robot.direction).to eq("")
  end

  context "Robot is on the board" do
    before(:each) do
      @robot.horizontal = 2
      @robot.vertical = 1
      @robot.direction = "north"
    end
    it "moves robot one spot in location it's facing" do
      @robot.move
      expect(@robot.vertical).to eq (2)
    end
    it "will report the location when asked" do
      expect(@robot.report).to start_with ("You are located")
    end
  end

  context "Robot is out of bounds" do
    before(:each) do
      @robot.horizontal = 4
      @robot.vertical = 4
      @robot.direction = "east"
    end
    it "won't move robot if it will go beyond the board" do
      expect(@robot.vertical).to be < 5
      expect(@robot.horizontal).to be <5
    end
  end
end
