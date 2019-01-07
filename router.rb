# gets the input and sends to the controller
class Router
  def initialize(controller)
    @controller = controller
    @running = true
  end

  def run
    puts "Welcome to the Toy Robot!"
    puts "Place your robot to start, select PLACE X, Y, F"
    @controller.place
    puts "Yay! You have started!"
    while @running
      start_menu
      action = gets.chomp.downcase
      print `clear`
      route_action(action)
    end
  end

  private

  def start_menu
    puts ""
    puts "What do you want to do?"
    puts "PLACE"
    puts "MOVE"
    puts "LEFT"
    puts "RIGHT"
    puts "REPORT"
    puts "STOP"
  end

  end

  def route_action(action)
    case action
    when "place" then @controller.place
    when "move" then @controller.move
    when "left" then @controller.left
    when "right" then @controller.right
    when "report" then @controller.report
    when "stop" then stop
    else
      puts "Please choose an option on the menu"
  end

  def stop
    @running = false
  end
end
