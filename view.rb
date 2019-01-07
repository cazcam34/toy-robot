require 'pry-byebug'
require 'pry'

class RobotView
  def ask_place
    print "PLACE "
    gets.chomp
  end

  def location(horizontal, vertical, direction)
    puts "You are located at horizontal #{horizontal} and vertical #{vertical} facing #{direction}."
  end

  def try_again
    puts "Ba-Bow...You can't move beyond the edge, you are trying to move too far."
  end
end
