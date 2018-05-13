require "enumerable"

describe "#my_inject" do
  context "test with array init value = 0" do
    before { @array = [1,2,3,4]}

    # it "when no valid block given then  must raise an error " do
    #   expect{ @array.my_inject}.to raise_error SyntaxError
    # end

    it "given an array must return the sum  " do
      expect(@array.my_inject{|c,x| c + x }).to eq(10)
    end


    it "with an  array when i give  a valid block then array must be invariant" do
       @array.my_inject{|c, x|  c + x }
       expect(@array).to eq([1,2,3,4])
    end
  end

  context "test with array init value = 2" do
    before { @array = [1,2,3,4]}

    # it "when no valid block given then  must raise an error " do
    #   expect{ @array.my_inject(2)}.to raise_error SyntaxError
    # end

    it "given an array and an initial value  must return the sum " do
      expect(@array.my_inject(2){|c,x| c + x }).to eq(12)
    end


    it "with an  array when i give  a valid block then array must be invariant" do
       @array.my_inject(2){|c, x|  c + x }
       expect(@array).to eq([1,2,3,4])
    end
  end

end
