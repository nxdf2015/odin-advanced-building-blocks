
def bubble_sort(arr)
    size = arr.length 
    invert = true
    i = 0
    while invert 
        invert = false        
        (0..size-2).each do |j|
            if arr[j] > arr[j.succ ]
               invert = true
               arr[j+1] , arr[j] = arr[j] , arr[j+1]             
            end        
        end        
    end

   arr
end


#with a block
def bubble_sort_by(arr)    
    size = arr.length
    invert = true
    begin
        invert = true        
        (0..size-2).each do |j|
            if yield(arr[j],arr[j + 1 ] )
               invert = false
               arr[j+1] , arr[j] = arr[j] , arr[j+1]             
            end 
        end
      
    end until invert
    arr
end


def generate(size = 20)
    (1..size).to_a.map do 
        rand(50) end
end




data =  generate
p  data 


p bubble_sort_by(data) { |a,b| 
   a > b
}