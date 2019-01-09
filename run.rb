require_relative 'router'
require_relative 'robot'

@robot = Robot.new
@router = Router.new(@robot)
@running = true

puts "Welcome to the Toy Robot!"
puts "Place your robot to start."
while @running
  start_menu
  user_input = gets.chomp.downcase
  print `clear`
  message = @router.route_action(user_input)
  if message == "stop"
    running = false
  else !message.blank
    print message
  end
  print @router.route_action(report)
end

def start_menu
  puts ""
  puts "What do you want to do?"
  puts "PLACE 'X-Coordinate', 'Y-Coordinate', 'Direction (North, South, East, West)"
  puts "MOVE"
  puts "LEFT"
  puts "RIGHT"
  puts "REPORT"
  puts "STOP"
end
