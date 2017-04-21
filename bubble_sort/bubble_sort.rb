

def bubble_sort(array)
  array = array.clone
  (array.length).times {
  i = 0
     begin
     p  = array[i,2]
     array[i,2] = p.reverse  if p[0] - p[1] > 0
     end while (i+=1) < array.length-1
   }
array
end


 
