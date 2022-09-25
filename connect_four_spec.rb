require './lib/main'
 describe Player do
   let (:subject) { Player.new("[X]")}
  describe "#pick_a_number" do
    it "returns the exact position of the chosen element" do
      num = 5
      expect(subject.pick_a_number(num)).to eq(0)
    end
  end

  describe "#change_board" do
    it "returns array of all chosen elements" do
      num = 4
      highest_point = 0
      expect(subject.change_board(num, highest_point)).to eq([[4, 0, "[X]"]])
    end

    it "returns at least two elements is highest_point is bigger than 0" do
      num = 4
      highest_point = 1
      expect(subject.change_board(num, highest_point)).not_to eq([[4, 0, "[X]"]])
    end
 end

 describe "#create_board" do
  it "returns array with length of 7" do
    arr = [[4, 0, "[X]"]]
    board = subject.create_board(arr)
    expect(board.length).to eq(7)
  end

  it "always changes elements that are put on the begining" do
    arr = [[4, 0, "[X]"], [5, 0, "[O]"]]
    board = subject.create_board(arr)
    expect(board[4][0] && board[5][0]).not_to eq("[-]")
  end
 end

 describe "#game_end" do
  it "returns the string with information about who won" do
    sign = "[O]"
    expect(subject.game_end(sign)).to eq("Player 1 Won")
  end

  it "returns nil, if the sign is not equal to '[O]' or '[X]'" do
    sign = 2
    expect(subject.game_end(sign)).to eq(nil)
  end
 end
end