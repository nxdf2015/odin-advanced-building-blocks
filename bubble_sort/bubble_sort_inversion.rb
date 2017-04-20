

def bubble_sort(array)
  array = array.clone
  (array.length).times {
  i = 0
  sorted = true
  while i < array.length-1  do
       y = array[i+1]
       x = array[i]
       sorted, array[i,2] = false , array[i,2].reverse if y < x
       i+=1

 end
 if sorted
   break
 end
 }
array

end

 # a = (1..20).to_a
 #
 #  p %W/ #{bubble_sort(a)} #{a} /
