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
    board = create_board(arr)
    expect(board.length).to eg(7)
  end
 end
end