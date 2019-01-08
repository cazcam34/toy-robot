require 'rspec/autorun'

# PROGRAM

class Robot
  attr_accessor :horizontal, :vertical, :direction, :moving
  def initialize
    @horizontal = 0
    @vertical = 0
    @direction = ""
  end

  def move
    if @direction == "east"
      @moving = 1
      approve_horizontal
      report
    elsif @direction == "west"
      @moving = -1
      approve_horizontal
      report
    elsif @direction == "north"
      @moving = 1
      approve_vertical
      report
    elsif @direction == "south"
      @moving = -1
      approve_vertical
      report
    else
      puts "Your robot isn't facing a valid direction. Place your robot and set a direction."
    end
  end

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

  def report
   "You are located at horizontal #{@horizontal} and vertical #{@vertical} facing #{@direction}."
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
      @robot.report.should eq("You are located at horizontal 2 and vertical 1 facing north.")
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
