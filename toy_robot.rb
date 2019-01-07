require 'rspec/autorun'

# PROGRAM

class Robot
  attr_accessor :horizontal, :vertical, :direction, :moving
  def initialize
    @horizontal = 0
    @vertical = 0
    @direction = ""
  end

  def move(direction)
    if direction == "east"
      @moving = 1
      approve_horizontal
      report(@horizontal, @vertical, @direction)
    elsif direction == "west"
      @moving = -1
      approve_horizontal
      report(@horizontal, @vertical, @direction)
    elsif direction == "north"
      @moving = 1
      approve_vertical
      report(@horizontal, @vertical, @direction)
    elsif direction == "south"
      @moving = -1
      approve_vertical
      report(@horizontal, @vertical, @direction)
    else
      puts "Your robot isn't facing a valid direction. Place your robot and set a direction."
    end
  end

  private

  def approve_horizontal
    if (@horizontal + @moving) > 4 || (@horizontal + @moving) < 0
      try_again
    else
      @horizontal += @moving
    end
  end

  def approve_vertical
    if (@vertical + @moving) > 4 || (@vertical + @moving) < 0
      try_again
    else
      @vertical += @moving
    end
  end

  def try_again
    puts "Ba-Bow...You can't move beyond the edge, you are trying to move too far."
  end

  def report(horizontal, vertical, direction)
   puts "You are located at horizontal #{horizontal} and vertical #{vertical} facing #{direction}."
  end

end

# TESTING

describe Robot do
  before(:each) do
    @robot = Robot.new
  end

  it "can initialize a robot" do
    expect(@robot).to be_a(Robot)
  end

  it "initializes robot at the origin (0,0) with no direction" do
    expect(@robot.horizontal).to eq(0)
    expect(@robot.vertical).to eq(0)
    expect(@robot.direction).to eq("")
  end

  it "moves robot one spot in location it's facing" do
    @robot.direction = "north"
    @robot.move(@robot.direction)
    expect(@robot.vertical).to eq (1)
  end
end
