# gets the input and sends to the controller
require 'pry-byebug'
require 'pry'

# change name to play? or run?
class Router
  def initialize(robot)
    @robot = robot
  end

  def route_action(user_input)
    # extract place keyword from input
    if user_input.start_with?("place")
      action = "place"
    else
      action = user_input
    end
    case action
    when "place" then
    #extract place arguments to answer and create array of values
      answer = user_input.gsub("place", "")
      arr = answer.split(',').map { |item| item.strip }
    #validate the variables entered
      validate_place_input(arr)
    #once valid assign variables
      x = arr[0].to_i
      y = arr[1].to_i
      dir = arr[2]
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

  def validate_place_input(arr)
        # validation of input (numbers only)
    while (arr[0].to_i.zero? && (arr[0] != '0')) || (arr[1].to_i.zero? && (arr[1] != '0'))
      return 'Please select numbers to move horizontally and vertically. Try again.'
    end
    # validation of input (direction)
    until ['north', 'south', 'east', 'west'].include? arr[2].downcase
      return 'Please select a valid direction (North, South, East or West). Try again.'
    end
  end
end


# rspec router
# validate input
# validate please choose an option on the menu
