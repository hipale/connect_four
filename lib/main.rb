class Board
  attr_accessor :parent, :child, :position
  def initialize(position, parent = nil, child = nil)
    @position = position
    @child = child
  end
end

$hash = {}
$score = {}
$picked_pos = []
class Player
  def initialize
   
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
    puts $hash[num]
    change_board(num - 1, $hash[num])
  end

  def change_board(num, highest_point)
    $picked_pos.push([num, highest_point])
    create_board($picked_pos, "[O]")
    player_won(num, highest_point, "[O]")
  end

  def player_won(x, y, sign)
    @dif_moves = [[x + 1, y], [x - 1, y], [x + 1, y + 1], [x + 1, y - 1], 
    [x, y + 1], [x, y - 1], [x - 1, y + 1], [x - 1, y - 1]]
    if $picked_pos.any? do |elm|
      if @dif_moves.any? do |para|
        if para == elm 
          @start_pos = para
          until $picked_pos.none? { |dif_val| dif_val == para }
            para[0] += 1 if para[0] > x
            para[0] -= 1 if para[0] < x
            para[1] += 1 if para[1] > y
            para[1] -= 1 if para[1] < y
          end
          if @start_pos[0] - elm [0] > 2 || @start_pos[1] - elm [1] > 2 ||
            elm[0] - @start_pos[0] > 2  || elm[1] - @start_pos[1] > 2
            game_end()
          end
        end
      end
    end
  end
end
end

  def game_end
    puts "Player Won"
   return "Player Won"
  end
end

p = Player.new
p.pick_a_number(5)

c = Player.new
c.pick_a_number(5)