require "enumerable"


describe "#my_none?" do
  context "test with array" do
    before { @array = [1,2,3,4] }
    

    it "with an  array when i give  a valid block then array must be invariant" do
       @array.my_none?{|x| x%2 == 0}
       expect(@array).to eq([1,2,3,4])
    end
  end


end
