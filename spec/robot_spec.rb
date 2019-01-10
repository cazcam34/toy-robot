require_relative 'spec_helper'

# RSPEC TESTING
describe Robot do
# initialize a new robot prior to each test case
  before(:each) do
    @robot = Robot.new
  end

  it "can initialize a robot" do
    expect(@robot).to be_a(Robot)
  end

  it "robot has to be placed on the table in position X,Y" do
    @robot.place(1,2,"EAST")
    expect(@robot.horizontal).to eq (1)
    expect(@robot.vertical).to eq(2)
  end

  it "robot has to be placed on the table facing NORTH, SOUTH, EAST or WEST" do
    @robot.place(1,2,"east")
    expect(@robot.direction).to eq ("east")
  end

  it "initializes robot at the south-west origin (0,0)" do
    expect(@robot.horizontal).to eq(0)
    expect(@robot.vertical).to eq(0)
  end

  it "move will move the robot one unit forward in direction it is facing" do
    @robot.place(1,1,"north")
    @robot.move
    expect(@robot.vertical).to eq(2)
  end

  it "left will rotate the robot 90 degrees in the direction" do
    @robot.place(3,4,"south")
    @robot.left
    expect(@robot.direction).to eq("east")
  end

  it "right will rotate the robot 90 degrees in the direction" do
    @robot.place(3,4,"south")
    @robot.right
    expect(@robot.direction).to eq("west")
  end

  it "report will announce the location of the robot" do
    @robot.place(0,4,"west")
    expect(@robot.report).to eq("You are located at X: 0 and Y: 4 facing west.")
  end

  it "robot won't be placed beyond the board" do
    @robot.place(8,8,"north")
    expect(@robot.placed).to eq(false)
  end

  it "robot won't be moved beyond the board" do
    @robot.place(0,4,"west")
    expect(@robot.move).to start_with("Ba-Bow...You")
  end

# test cases using example data from problem
  it "Example a" do
    @robot.place(0,0,"north")
    @robot.move
    expect(@robot.report).to eq("You are located at X: 0 and Y: 1 facing north.")
  end

  it "Example b" do
    @robot.place(0,0,"north")
    @robot.left
    expect(@robot.report).to eq("You are located at X: 0 and Y: 0 facing west.")
  end

  it "Example c" do
    @robot.place(1,2,"east")
    @robot.move
    @robot.move
    @robot.left
    @robot.move
    expect(@robot.report).to eq("You are located at X: 3 and Y: 3 facing north.")
  end
end
