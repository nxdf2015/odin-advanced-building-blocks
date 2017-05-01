require "enumerable.rb"

describe "#my_each" do
  context "test with array " do

    let(:array){(1..5).to_a}

      it "when i don't pass a block then receive an error " do
         expect{ array.my_each}.to raise_error  SyntaxError
      end

      it  "pass an empty block then i receive  nil" do
        expect(array.my_each {} ).to be_nil
     end

     it "given an empty array then i must receive nil" do
       expect([].my_each {|x| s += x}).to be_nil
     end

     it "given a non enumerable object then i receive a method_error" do
        expect {1.my_each {|x| s += x}}.to raise_error  NoMethodError
     end


     it "when i pass a block {|x| s = x+1 } then s must equal to the sum" do
         s = 0
         array.my_each {|x| s += x}
         expect(s).to eq(15)
    end

  end

  context "test with hash" do

    before {@hash = {a: 1 , b: 2 , c: 3} }

    it "when i don't pass a block then must return an error " do
       expect{ @hash.my_each}.to raise_error  SyntaxError
    end

    it  "pass an empty block must return nil" do
      expect(@hash.my_each {} ).to be_nil
   end

   it "when i pass a block {|x| s = x+1 } then s must equal to the sum" do
       s = ""
       @hash.my_each {|x,k| s += x.to_s * k}
       expect(s).to eq("abbccc")
  end
  end

  context "no mutation of the object pass to my_each " do
    let(:array){ [1,2,3]}
    it "array must be invariant" do
      s = 0
      array.my_each {|x| s+= x}
      expect(array).to eq(array)
    end
  end

end
