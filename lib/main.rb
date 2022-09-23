class Board
  attr_accessor :parent, :child, :position
  def initialize(position, parent = nil, child = nil)
    @position = position
    @child = child
  end
end

class Player
  def initialize
    @hash = {}
    @score = {}
  end

  def create_board(array, sign)
    y = 0; x = 0
    until y == 7
      puts
      until x == 7
        if array.any? { |elm| elm[0] == y && elm[1] == x}
          print "#{sign}"
        else 
          print "[-]"
        end
        x += 1
      end
      y += 1
      x = 0
    end
  end

  def pick_a_number(num)
     @score[num] == nil ? @score[num] = 0 : @score[num] += 1
     @hash[num] = @score[num]
   
    change_board(num - 1, @hash[num])
  end

  def change_board(num, highest_point)
    puts num
  picked_pos = [[num, highest_point]]
  create_board(picked_pos, "O")
  end
end

p = Player.new
puts p.pick_a_number(5)
puts p.pick_a_number(5)
