

def bubble_sort(array)
  count = 0
  array = array.clone
  (array.length).times {
  i = 0
  while i < array.length-1  do
       y = array[i+1]
       x = array[i]
       array[i+1],array[i] = x , y  if y < x
       i+=1

 end}
array

end

 a = (1..20).to_a.shuffle

  p %W/ #{bubble_sort(a)} #{a} /
