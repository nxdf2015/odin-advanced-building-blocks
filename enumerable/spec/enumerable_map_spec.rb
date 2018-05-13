require "enumerable"

describe "#my_map" do

  before { @array = [1,2,3,4]}

  #  context "given no  block or no proc then i receive an error " do

  #    it "given  no proc and no  block given then i receive  an error " do
  #      expect{ @array.my_map}.to raise_error SyntaxError
  #    end
  #  end

   context "given a block " do

     it "given {|x| x + 1} then must return [2,3,4,5] " do
       expect(@array.my_map{| x| x + 1 }).to eq([2,3,4,5])
     end

     it "with an  array when i give  a valid block then array must be invariant" do
        @array.my_map{| x|  x + 1 }
        expect(@array).to eq([1,2,3,4])
     end


   end


   context "given a proc" do
     let(:proc){ Proc.new do |x| x + 1 end }

       it "given {|x| x + 1} then must return [2,3,4,5] " do
         expect(@array.my_map(proc)).to eq([2,3,4,5])
       end

       it "with an  array when i give  a valid block then array must be invariant" do
          @array.my_map(proc)
          expect(@array).to eq([1,2,3,4])
       end

   end

end
