class Board
  attr_accessor :parent, :child, :position
  def initialize(position, parent = nil, child = nil)
    @position = position
    @child = child
  end
end

class Player
  def initialize
    $hash = {}
    $score = {}
    @picked_pos = []
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
      y += 1; x = 0
    end
  end

  def pick_a_number(num)
     $score[num] == nil ? $score[num] = 0 : $score[num] += 1
     $hash[num] = $score[num]
   
    change_board(num - 1, $hash[num])
  end

  def change_board(num, highest_point)
  @picked_pos.push([num, highest_point])
  create_board(@picked_pos, "[O]")
  player_won(num, highest_point, "[O]")
  end

  def player_won(x, y, sign)
    @dif_moves = [[x + 1, y], [x - 1, y], [x + 1, y + 1], [x + 1, y - 1], 
    [x, y + 1], [x, y - 1], [x - 1, y + 1], [x - 1, y - 1]]
          puts"C"
          counter = 0
          if @dif_moves.any? { |g| @picked_pos.any? { |elm| elm == g}}
            until counter == 2
              puts "D"
              puts counter
             g[0] += 1 if g[0] > x
             g[0] -= 1 if g[0] < x
             g[1] += 1 if g[0] > y
             g[1] -= 1 if g[0] < y
             counter += 1
            end
            return "Player Won"
          end
  end
end

p = Player.new
p.pick_a_number(5)
p.pick_a_number(5)
p.pick_a_number(5)
p.pick_a_number(5)
