require_relative 'spec_helper'

describe Robot do
  let(:robot) { Robot.new }

  it "can initialize a robot" do
    expect(robot).to be_a(Robot)
  end

  it "initializes robot at the origin (0,0) with no direction" do
    expect(robot.horizontal).to eq(0)
    expect(robot.vertical).to eq(0)
    expect(robot.direction).to eq("")
  end
end
