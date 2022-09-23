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
  def pick_a_number(num)
    @score[num] = 0 if @score[num] == nil 
    @score[num] += 1
   @hash[num] = @score[num]
   puts @hash
   
  end
end

p = Player.new
puts p.pick_a_number(5)
puts p.pick_a_number(4)
puts p.pick_a_number(4)
puts p.pick_a_number(3)