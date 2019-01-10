# gets the input and sends to the controller
require 'pry-byebug'
require 'pry'
require 'rspec/autorun'
require_relative 'robot'

# Router to get the data from user through run and communicate with the robot object.
class Router
  def initialize(robot)
    @robot = robot
  end

  def route_action(user_input)
    # extract place keyword from input
    user_input.start_with?("place") ? (action = "place") : (action = user_input)
    case action
    when "place" then
    #extract user data to know where to place robot
      answer = user_input.gsub("place", "")
      arr = answer.split(',').map { |item| item.strip }
    #validate the data entered
    # make sure user enters numbers ONLY for x & y placement
      unless arr[0].match(/\d/) && arr[1].match(/\d/)
        return 'Please select numbers to move horizontally and vertically. Try again.'
      end
    # make sure user enters valid direction
      unless ['north', 'south', 'east', 'west'].include? arr[2].downcase
        return 'Please select a valid direction (North, South, East or West). Try again.'
      end
    #if data is valid assign variables to pass to the robot
      x = arr[0].to_i
      y = arr[1].to_i
      dir = arr[2].downcase
    # call the robots place method
      @robot.place(x, y, dir)
    when "move" then @robot.move
    when "left" then @robot.left
    when "right" then @robot.right
    when "report" then @robot.report
    when "stop" then return "stop"
    else
      return "Please choose an option on the menu"
    end
  end
end

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
