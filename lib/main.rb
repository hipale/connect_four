class Board
  attr_accessor :parent, :child, :position
  def initialize(position, parent = nil, child = nil)
    @position = position
    @child = child
  end
end

class Player
  def initialize(sign)
    @sign = sign
  end

  def turns(num)
    pick_a_number(num)
    new_board = create_board($picked_pos)
    player_won(@sign)
    new_board
  end

  def pick_a_number(num)
    $score[num] == nil ? $score[num] = 0 : $score[num] += 1
    until $score[num] < 7  && num < 8 && num > 0 do
      $score[num] -= 1
      puts "Wrong number"
      num = gets.chomp.to_i
      $score[num] == nil ? $score[num] = 0 : $score[num] += 1
    end
    $hash[num] = $score[num]
    change_board(num - 1, $hash[num])
  end

  def change_board(num, highest_point)
    @highest_point = highest_point
    $picked_pos.unshift([num, highest_point, @sign])
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
 
  def player_won(sign, num = 0, index = nil)
    selected_pos = $picked_pos.sort.select { |elm| elm[2] == sign }
    game_end(sign) && return if num == 3
    return if selected_pos.length < 4
    x = selected_pos[num][0]; y = selected_pos[num][1]
    dif_moves = [
      [x + 1, y], [x - 1, y], [x + 1, y + 1], [x + 1, y - 1], 
      [x, y + 1], [x, y - 1], [x - 1, y + 1], [x - 1, y - 1]
    ] 
    if index != nil then dif_moves = [dif_moves[index]] end
    dif_moves.each_with_index do |elm, inx|
      return if selected_pos[num + 1] == nil
      if selected_pos[num + 1][0] == elm[0] && selected_pos[num + 1][0] == elm[0]
        print elm
        inx = index if index != nil
        player_won(sign, num + 1, inx)
      end
    end
  end

  def game_end(sign)
    puts "a"
    $end_game = true
    return
  end
end

$hash = {}
$score = {}
$picked_pos = []
$end_game = false

until $end_game == true do
  return if $end_game == true
  p = Player.new("[O]")
  c = Player.new("[X]")
    puts "Player 1, chose a column"
    prompt = gets
    p.turns(prompt.to_i)
    return if $end_game == true
    puts "Player 2, chose a column"
    prompt = gets
    c.turns(prompt.to_i)
end