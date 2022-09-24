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
  def initialize(sign)
    @sign = sign
  end

  def create_board(array)
    y = 0; x = 0
    until y == 7
      puts
      until x == 7
          if array.any? { |elm|  elm[0] == y && elm[1] == x}
            array.any? { |elm|  print elm[2] if elm[0] == y && elm[1] == x }
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
    $picked_pos.push([num, highest_point, @sign])
    create_board($picked_pos)
    player_won(num, highest_point, @sign)
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

p = Player.new("[O]")
p.pick_a_number(5)


c = Player.new("[X]")
c.pick_a_number(5)

p.pick_a_number(5)

c.pick_a_number(5)