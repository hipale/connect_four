class Board
  attr_accessor :child, :position
  def initialize(position, child = [])
    @position = position
    @child = []
  end
end

class Player
  def initialize
    #@hash = {}
  end
  def pick_a_number(num)
    #@hash = {num: high_point = 0}
    if num < 0 || num > 7 
      return
    else
      create_board(num, 0)
      #@hash = {num: high_point + 1}
     
    end
  end
  
  def create_board(x, y, child = nil)
    if x > 6 || x < 0 || y > 6 || y < 0
      return
    else
      b = Board.new([x, y], child)
      b.child = [
        [x + 1, y], [x - 1, y], [x + 1, y + 1], [x + 1, y - 1], 
        [x, y + 1], [x, y - 1], [x - 1, y + 1], [x - 1, y - 1]
      ] if b.child == nil
      b.child.each { |pos| create_board(pos[0], pos[1], pos)}
      change_board(b, "O")
    end
  end

  def change_board(board, sign)
    board.position = sign
    print board
  end
end

p = Player.new
pp p.pick_a_number(5)