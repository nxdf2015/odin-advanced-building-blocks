require "enumerable"

describe "#my_all?" do
  context "test with array" do
    before { @array = [1,2,3,4]}

    it "when no valid block given then  must raise an error " do
      expect{ @array.my_all?}.to raise_error SyntaxError
    end

    it "given {|x| x > 0} then must return true " do
      expect(@array.my_all?{|x| x > 0}).to be true
    end

    it "given {|x| x%2 == 0 } then must return false " do
      expect(@array.my_all?{|x| x%2 == 0}).to be false
    end

    it "with an  array when i give  a valid block then array must be invariant" do
       @array.my_all?{|x| x%2 == 0}
       expect(@array).to eq([1,2,3,4])
    end
  end




end
