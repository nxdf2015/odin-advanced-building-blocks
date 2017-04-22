

def bubble_sort(array)
  array = array.clone
  pos = 0
  begin
  sorted = true
  i = 0
     begin
     p  = array[i,2]
       begin
         array[i,2] = p.reverse
         sorted = false
       end if  p[0] - p[1] > 0
     end while (i+=1) < array.length - pos - 1
     pos += 1
   end until sorted
   array
end
