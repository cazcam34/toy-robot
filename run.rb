require_relative 'router'
require_relative 'robot'
require 'pry-byebug'
require 'pry'

# Get and present data from/to user through the terminal

def start_menu
  puts "What do you want to do?"
  puts "PLACE 'X-Coordinate', 'Y-Coordinate', 'Direction (North, South, East, West)"
  puts "MOVE"
  puts "LEFT"
  puts "RIGHT"
  puts "REPORT"
  puts "STOP"
end

@robot = Robot.new
@router = Router.new(@robot)
running = true

puts "Welcome to the Toy Robot!"
puts "Place your robot to start."
puts ""
while running
  start_menu
  print ">> "
  user_input = gets.chomp.downcase
# pass user input to router for data validation and method calling
  message = @router.route_action(user_input)
# stop running the loop and end the program with stop input
  if message == "stop"
    running = false
  # return the messages to the user from the robot
  else message.nil? == false
    puts message
    puts ""
  end
end
