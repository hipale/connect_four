require './lib/main'

describe '#pick_a_number' do 
  it "return an y axis position and highest point in the column" do
    context "The row 5 was already picked once" do
      picked_num = 5
      highest_point = 1
      expect(pick_a_number(picked_num, highest_point)).to eq([[5][1]])
    end
  end

  it "changes the highest_point in this column by one" do
    picked_num = 4
    highest_point = 0
    expect(pick_a_number(picked_num, highest_point)).to change(highest_point).by(1)
  end

  describe "#comp_picks" do
    it "return the position of the highest point in the column" do
      comp_pick = 6
      highest_point = 0
      expect(comp_pick).to be eq([[6][0]])
    end
  end
end
  describe "#change_board" do
    subject(:board)  { Board.new }
    it "changes the board when player picks an number" do 
      pick_a_number = [[4][0]]
      expect(board[pick_a_number[1]]).to eq([1, 2, 3, "O", 5, 6, 7])
    end

    it "changes the board when a computer picks an number" do
      pick_a_number = [[4][0]]
      comp_pick = [[5][0]]
      expect(board[pick_a_number[1]]).to eq([1, 2, 3, "O", "X", 6, 7])
    end

    it "changes more than one picked number" do
      board[pick_a_number[1]] = [1, 2, 3, "O", "X", 6, 7]
      pick_a_number = [[4][1]]
      expect(board[pick_a_number[1]]).to eq([1, 2, 3, "O", 5, 6, 7])
    end
  end


describe "#play_won" do
  subject(:board)  { Board.new }

  it "returns a player won comunicat" do
    board[0] = [1, 2, 3, "O", "X", 6, 7]
    board[1] = [1, 2, 3, "O", "X", 6, 7]
    board[2] = [1, 2, 3, "O", 5, 6, 7]
    expect(play_won(board)).to eq("Player had Won")
  end

end
