

def bubble_sort(array)
  array = array.clone
  begin
  sorted = true
  i = 0
     begin
     p  = array[i,2]
       begin
         array[i,2] = p.reverse
         sorted = false
       end if  p[0] - p[1] > 0
     end while (i+=1) < array.length-1
     p sorted
   end until sorted
   array
end
 # 
 # a = (1..20).to_a
 #
 #  p %W/ #{bubble_sort(a)} #{a} /
