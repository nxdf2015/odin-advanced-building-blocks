require "enumerable.rb"

describe "#my_each" do
  context "test with array " do

    let(:array){(1..5).to_a}

      # it "when i don't pass a block then receive an error " do
      #    expect{ array.my_each}.to raise_error  SyntaxError
      # end
 

     it "given a non enumerable object then i receive a method_error" do
        s = 0 
        expect {1.my_each {|x| s += x}}.to raise_error  NoMethodError
     end


     

   

 

    
  end

  

end
