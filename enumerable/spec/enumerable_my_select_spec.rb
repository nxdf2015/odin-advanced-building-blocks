require "enumerable"


describe "#my_select" do
  context "test with array" do
    before { @array = [1,2,3,4]}
    # it "when no valid block given then  must raise an error " do
    #   expect{ @array.my_select}.to raise_error SyntaxError
    # end

    it "given {|x| x % 2 == 0} then must return even number" do
      expect(@array.my_select{|x| x%2 == 0}).to eq([2,4])
    end

    it "with an  array when i give  a valid block then array must be invariant" do
       @array.my_select{|x| x % 2 == 0}
      
       expect(@array).to match_array([1,2,3,4])
    end
  end


end
