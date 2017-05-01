require "enumerable"

describe "#my_count" do
  context "test with array" do
    before { @array = [1,2,3,4]}

    it "given no block given then  i receive the length of the array " do
      expect(@array.my_count).to eq(4)
    end

    it "given {|x| x > 2} then i receive 2 " do
      expect(@array.my_count {|x| x > 2}).to eq(2)
    end

    it "with an  array when i give  a valid block then array must be invariant" do
       @array.my_count{|x| x >2 }
       expect(@array).to eq([1,2,3,4])
    end
  end




end
