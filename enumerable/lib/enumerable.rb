


module Enumerable 
     
    

    def my_each(&bloc)                
        for item in self  
            yield(item)
        end
        
    end

    def my_each_with_index 
        (0..self.length).my_each do |i|
            yield(i,self[i])
        end
    end

    def my_select 
        r = []
       self.my_each { |x| p x ; r <<x   if yield(x) }
       r 
    end

    def my_all?(&block)     
        self.eql? (self.select &block)
    end

    def my_any?
        i = 0
        size = self.length
        while i < size do                 
            break if yield(self[i])
            i += 1
    end
        not(i == size)
    end


    def my_none?(&block)
        not self.my_any? &block
    end

    def my_count(&block)
        return self.length unless block_given?  
        (self.select &block).length

    end

    def my_map(bloc = nil)
        f = Proc.new {|x| 
        if block_given? 
            yield(x)
        elsif bloc.is_a? Proc
            bloc.call(x)
        end      
        }

        t = []
        for x in self
            t <<  f.call(x) 
        end
        t
    
    end

    def my_inject(init = 0 )
        acc = init
        self.each do |x|  acc = yield(acc,x) end   
        acc         
    end
end

def multiply_els(arr)
    arr.my_inject(1) { |acc,x| acc * x}
end



 