require_relative 'spec_helper'

# RSPEC TESTING ROUTER
# initialise a new robot and router prior to each test
describe Router do
  before :each do
    @robot = Robot.new
    @router = Router.new(@robot)
  end

  it "first valid command is the place command" do
    @router.route_action("move")
    expect(@robot.placed).to eq(false)
  end

  it "will only accept numbers for the x and y positions" do
    expect(@router.route_action("place 1, a, west")).to start_with("Please select numbers")
  end

  it "will only accept 'north', 'south', 'east', and 'west' directions" do
    expect(@router.route_action("place 1, 3, oops")).to start_with("Please select a valid direction")
  end
end
