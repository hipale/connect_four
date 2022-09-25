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

  def turns(num)
    
    pick_a_number(num)
    change_board(num - 1, $hash[num])
    new_board = create_board($picked_pos)
    player_won(num, @highest_point, @sign)
    new_board
  end

  def pick_a_number(num)
    $score[num] == nil ? $score[num] = 0 : $score[num] += 1
    $hash[num] = $score[num]
  end

  def change_board(num, highest_point)
    @highest_point = highest_point
    $picked_pos.push([num, highest_point, @sign])
  end

  def create_board(array)
    y = 0; x = 0; @board = []
    until y == 7
      @board.push([])
      puts 
      until x == 7
          if array.any? { |elm|  elm[0] == y && elm[1] == x}
            array.any? { |elm| @board[y].push(elm[2]) if elm[0] == y && elm[1] == x }
          else
            @board[y].push("[-]")      
          end
          print @board[y][-1]
        x += 1
      end
      y += 1; x = 0
    end
    @board
  end
 
  def player_won(x, y, sign)
    puts sign
    selected_pos = $picked_pos.select { |elm| elm.include? sign } 
    if selected_pos.length >= 4
      puts "as"
      num = 3
      if selected_pos.all? { |elm| elm[0] == num}
        puts "As"
        game_end(sign) if selected_pos[num][-1] - selected_pos[num][-4] == 4
      elsif selected_pos.all? { |elm| elm[1] == num }
        puts "As"
        game_end(sign) if selected_pos[-1][num] - selected_pos[-4][num] == 4
      end
    end
  end

  def game_end(sign)
    puts "as"
    return "Player 1 Won" if sign == "[O]"
    return "Player 2 Won" if sign == "[X]"
  end
end

p = Player.new("[X]")
p.turns(4)
p.turns(4)
p.turns(4)
p.turns(4)
c = Player.new("[O]")
c.turns(6)


