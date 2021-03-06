# gets the input and sends to the controller
require 'pry-byebug'
require 'pry'
require_relative 'robot'

# Router to get the data from user through run and communicate with the robot object.

class Router
  def initialize(robot)
    @robot = robot
  end

  def route_action(user_input)
    # extract place keyword from input
    user_input = user_input.downcase
    user_input.start_with?("place") ? (action = "place") : (action = user_input)
    case action
    when "place" then
    # extract user data to know where to place robot
      answer = user_input.gsub("place ", "").gsub(",", " ")
    # make sure data is entered correctly and that the x & y inputs are numbers
      if answer.match(/\d+\W+\d+\W+\w+/)
    # turn user input to an array of three variables
        arr = answer.split(' ').map { |item| item.strip }
      else
        return "Please re-enter your place data as 'PLACE X,Y,DIRECTION'. X & Y must be number co-ordinates."
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
