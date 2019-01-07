require_relative 'spec_helper'

describe RobotController do
  let(:controller) { RobotController.new }
  let(:robot) { Robot.new }
  let(:view) { RobotView.new }


  it "won't let the robot go off the board" do
    # allow(controller).to receive(:place).and_return("3,3,NORTH")
    # expect(robot.horizontal).to eq 3
    # robot_test = instance_double("Robot", :horizontal => 10)
    # allow(view).to receive(:ask_place).with("1,9,north")
    # allow(controller).to receive(:place)
    robot = Robot.new
    robot.horizontal = 10
    expect(robot.horizontal).to be < 5
    expect(robot.vertical).to be < 5
    # allow(controller).to receive(:place).and_return(view.try_again)
    # allow(controller).to receive(:get_place_input).and_return(["9", "9", "north"])
  end

  it "will only start with the place command" do
    controller = RobotController.new
    robot = Robot.new
    allow(controller).to receive(:place).with("1,9,north")
    expect(robot.horizontal).to eq(1)

  end

  it "will move one space in the direction it is facing" do
    expect(controller.moving).to eq (1)
  end

  it "will rotate left or right and change direction" do
    robot_test = instance_double("Robot", :horizontal => 0, :vertical => 0, :direction => "north")
    expect(controller).to receive(:left)
    expect(robot_test.direction).to be ("east")
  end

  it "will report the location when asked" do
  end

  it "will only accept numbers for the horizontal and vertical place command" do
    expect(controller).to respond_to :place
    expect(robot.horizontal).to be_a Integer
  end

  it "will only accept valid directions for the robot direction" do
  end
end
